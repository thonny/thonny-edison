from thonny.globals import get_workbench
import tempfile
import traceback
import ast
import sys
from tkinter.messagebox import showerror
import os
import json
import subprocess

def program_edison():
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

def load_plugin():
    image_path = os.path.join(os.path.dirname(__file__), "res", "tools.program_edison.gif")
    get_workbench().add_command("program_edison", "tools", "Send current script to Edison",
                                program_edison,
                                program_edison_enabled,
                                #default_sequence="<Control-e>",
                                group=120,
                                image_filename=image_path,
                                include_in_toolbar=True)
