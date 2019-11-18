from thonny.backend import get_vm, Executor, prepare_hooks, return_execution_result

import sys
import os.path
import subprocess

from thonny.common import get_augmented_system_path, get_exe_dirs, update_system_path
from threading import Thread


def _compile_script(script_path):
    edpy_dir = os.path.join(os.path.dirname(__file__), "EdPy")
    edpy_script = os.path.join(edpy_dir, "EdPy.py")
    lang_file = os.path.join(edpy_dir, "en_lang.json")
    _execute_system_command([sys.executable, edpy_script, lang_file, script_path])


def _execute_system_command(cmd, cwd=None):
    env = dict(os.environ).copy()
    encoding = "utf-8"
    env["PYTHONIOENCODING"] = encoding
    # Make sure this python interpreter and its scripts are available
    # in PATH
    update_system_path(env, get_augmented_system_path(get_exe_dirs()))
    popen_kw = dict(
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        shell=False,
        env=env,
        universal_newlines=True,
        bufsize=0,
    )

    if cwd and os.path.isdir(cwd):
        popen_kw["cwd"] = cwd

    if sys.version_info >= (3, 6):
        popen_kw["errors"] = "replace"
        popen_kw["encoding"] = encoding

    proc = subprocess.Popen(cmd, **popen_kw)

    def copy_stream(source, target):
        while True:
            c = source.readline()
            if c == "":
                break
            else:
                target.write(c)
                target.flush()

    copy_out = Thread(target=lambda: copy_stream(proc.stdout, sys.stdout), daemon=True)
    copy_err = Thread(target=lambda: copy_stream(proc.stderr, sys.stderr), daemon=True)

    copy_out.start()
    copy_err.start()
    try:
        proc.wait()
    except KeyboardInterrupt as e:
        print(str(e), file=sys.stderr)

    copy_out.join()
    copy_err.join()


def program_edison(cmd):
    script_path = os.path.normpath(os.path.join(cmd["local_cwd"], cmd["args"][0])) 
    print("PRO", script_path)
    _compile_script(script_path)


def load_plugin():
    get_vm().add_command("ProgramEdison", program_edison)
