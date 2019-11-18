from thonny import get_workbench, get_runner
import tempfile
import traceback
import ast
import sys
from tkinter.messagebox import showerror
import os
import json
import subprocess
from thonny.running import BackendProxy
from thonny.misc_utils import running_on_windows
import collections
import signal
import threading

class EdisonProxy(BackendProxy):
    @classmethod
    def get_configuration_options(cls):
        return [""]
    
    def __init__(self, configuration_option):
        self._message_queue = collections.deque()
        self._flasher = None

    def supported_features(self):
        return []

    def get_description(self):
        return "Edison"        

    def send_command(self, cmd):
        if cmd.command == "Flash":
            proc = subprocess.Popen # TODO:
            self._flasher = SubprocessRunner(proc, self._message_queue)
            
        return False
    
    def fetch_next_message(self):
        if len(self._message_queue) == 0:
            return None
        
        event_type, data = self._flasher.event_queue.popleft()
        if event_type in ["stdout", "stderr"]:
            return {"message_type" : "ProgramOutput",
                    "stream_name" : event_type,
                    "data" : data}
        else:
            assert event_type == "returncode"
            return {"message_type" : "ToplevelResult"}
        

def program_edison_old():
    current_editor = get_workbench().get_editor_notebook().get_current_editor()
    code = current_editor.get_text_widget().get("1.0", "end")
    try:
        ast.parse(code)
        #Return None, if script is not saved and user closed file saving window, otherwise return file name.
        py_file = get_workbench().get_current_editor().save_file(False)
        if py_file is None:
            return
    except Exception:
        error_msg = traceback.format_exc(0)+'\n'
        showerror("Error", error_msg)
        return
    
    wav_filename = _compile_script(py_file)
    print(wav_filename)
    # TODO: get duration and set up a progress bar
    _play_wav(wav_filename)
    os.remove(wav_filename)
    
    # TODO: play wav
    # TODO: delete wav

def _play_wav(path):
    if os.name == "nt":
        import winsound
        winsound.PlaySound(path, winsound.SND_FILENAME)
    elif sys.platform == "darwin":
        # http://stackoverflow.com/a/3498622/261181
        subprocess.call(["afplay", path])
    else:
        # https://www.techwalla.com/articles/how-to-play-a-wav-file-in-python
        subprocess.call(["aplay", path])
        raise RuntimeError("Only mac and windows supported at the moment")

def _get_wav_duration(path):
    # http://stackoverflow.com/questions/7833807/get-wav-file-length-or-duration
    import wave
    import contextlib
    with wave.open(path,'r') as f:
        frames = f.getnframes()
        rate = f.getframerate()
        duration = frames / float(rate)
        return duration

def program_edison_enabled():
    code = _get_current_code()
    return code is not None and code.strip() != ""

def _compile_script(script_path):
    exe = sys.executable.replace("thonny.exe", "pythonw.exe") # TODO: ask from runner
    
    edpy_dir = os.path.join(os.path.dirname(__file__), "EdPy")
    edpy_script = os.path.join(edpy_dir, "EdPy.py")
    lang_file = os.path.join(edpy_dir, "en_lang.json")
    
    # TODO: use subprocess dialog ???
    out = subprocess.check_output([exe, edpy_script, lang_file, script_path])
    result = json.loads(out)
    if result["error"]:
        raise RuntimeError(result["error"])
    
    return result["wavFilename"]
    

def _get_current_code():
    editor = get_workbench().get_editor_notebook().get_current_editor()
    if editor is None:
        return None
    return editor.get_code_view().text.get("1.0", "end")

class SubprocessRunner:
    """Publishes incrementally the output of given subprocess in a queue.
    Allows cancelling"""
    
    def __init__(self, proc, event_queue=None):
        self._proc = proc
        self.stdout = ""
        self.stderr = ""
        self._stdout_thread = None
        self._stderr_thread = None
        self.returncode = None
        self.cancelled = False
        if event_queue is not None:
            self.event_queue = event_queue
        else:
            self.event_queue = collections.deque()
       
        def listen_stream(stream_name):
            stream = getattr(self._proc, stream_name)
            while True:
                data = stream.readline()
                self.event_queue.append((stream_name, data))
                setattr(self, stream_name, getattr(self, stream_name) + data)
                if data == '':
                    break
            
            self.returncode = self._proc.wait()
            self.event_queue.append("returncode", self.returncode)
        
        self._stdout_thread = threading.Thread(target=listen_stream, args=["stdout"])
        self._stdout_thread.start()
        if self._proc.stderr is not None:
            self._stderr_thread = threading.Thread(target=listen_stream, args=["stderr"])
            self._stderr_thread.start()
        
    def cancel(self):
        if self._proc.poll() is None:
            try:
                if running_on_windows():
                    os.kill(self._proc.pid, signal.CTRL_BREAK_EVENT)  # @UndefinedVariable
                else:
                    os.kill(self._proc.pid, signal.SIGINT)
                    
                self._proc.wait(2)
            except subprocess.TimeoutExpired:
                if self._proc.poll() is None:
                    # now let's be more concrete
                    self._proc.kill()
            
            
            self.cancelled = True
            # Wait for threads to finish
            self._stdout_thread.join(2)
            if self._stderr_thread is not None:
                self._stderr_thread.join(2)
                    


def load_early_plugin():
    get_workbench().add_basckend("Edison", EdisonProxy)    

def program_edison():
    get_runner().execute_current("ProgramEdison")

def load_plugin():
    image_path = os.path.join(os.path.dirname(__file__), "res", "tools.program_edison.gif")
    get_workbench().add_command("program_edison", "tools", "Send current script to Edison",
                                program_edison,
                                program_edison_enabled,
                                #default_sequence="<Control-e>",
                                group=120,
                                image=image_path,
                                caption="Program Edison",
                                include_in_toolbar=True)
