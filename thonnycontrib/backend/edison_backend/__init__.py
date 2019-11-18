from thonny.backend import get_vm

import sys
import json
import os.path
import subprocess
import math
import time
import threading
import shutil

_completion_msg = "Done! Disconnect Edison and press its triangle button!"

def _compile_script(script_path):
    print("Compiling", script_path, "...")
    edpy_dir = os.path.join(os.path.dirname(__file__), "EdPy")
    edpy_script = os.path.join(edpy_dir, "EdPy.py")
    lang_file = os.path.join(edpy_dir, "en_lang.json")
    proc = subprocess.Popen(
        [sys.executable, edpy_script, lang_file, script_path],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
    )
    proc.wait()

    out = proc.stdout.read()
    err = proc.stderr.read()
    if err:
        print(err, file=sys.stderr)

    result = json.loads(out)

    if result["error"]:
        print("Errors:", file=sys.stderr)
        for msg in result["messages"]:
            print(msg, file=sys.stderr)

        return None
    else:
        print("Compilation successful!")
        return result["wavFilename"]


def program_edison(cmd):
    script_path = os.path.normpath(os.path.join(cmd["local_cwd"], cmd["args"][0]))
    wav_path = _compile_script(script_path)

    if wav_path:
        wav_length = _get_wav_duration(wav_path)
        print("Connect your Edison, turn volume to maximum and press the round button.")
        input("Press ENTER to start programming (takes %d seconds) " % wav_length)
        print("Programming ...")
        progress_thread = None
        completion_box = [None]
        tty_mode = cmd.get("tty_mode", False) 
        if tty_mode:
            progress_thread = _show_progress_bar(
                math.ceil(wav_length), 50, completion_box
            )
        success = _play_wav(wav_path)
        completion_box[0] = success
        if progress_thread:
            progress_thread.join()
        
        if not tty_mode and success:
            print(_completion_msg)

        os.remove(wav_path)


def _show_progress_bar(sec, length, completion_box):
    
    def print_bar(progress):
        completed_blocks = int(progress * length)
        remaining_blocks = length - completed_blocks

        print("\r" + ("■" * completed_blocks) + ("□" * remaining_blocks), end=" ")
        
    def work():
        print("Starting", end="")
        for i in range(sec):
            if completion_box[0] is not None:
                break
            
            progress = min(i / sec, 1)
            print_bar(progress)
            time.sleep(1)
        
        if completion_box[0]:
            print("\r" + _completion_msg.ljust(length, " "))
        else:
            print("\r" + " ".ljust(length, " "))

    t = threading.Thread(target=work)
    t.start()
    return t


def _play_wav(path):
    if os.name == "nt":
        import winsound
        winsound.PlaySound(path, winsound.SND_FILENAME)
        return True
    elif sys.platform == "darwin":
        # http://stackoverflow.com/a/3498622/261181
        subprocess.check_call(["afplay", path])
        return True
    else:
        # https://www.techwalla.com/articles/how-to-play-a-wav-file-in-python
        if shutil.which("aplay"):
            subprocess.check_call(["aplay", "-q", path])
            return True
        else:
            print("Command 'aplay' not found. Try installing 'alsa-utils' with your system package manager!")
            return False


def _get_wav_duration(path):
    # http://stackoverflow.com/questions/7833807/get-wav-file-length-or-duration
    import wave
    import contextlib

    with wave.open(path, "r") as f:
        frames = f.getnframes()
        rate = f.getframerate()
        duration = frames / float(rate)
        return duration


def load_plugin():
    get_vm().add_command("ProgramEdison", program_edison)
