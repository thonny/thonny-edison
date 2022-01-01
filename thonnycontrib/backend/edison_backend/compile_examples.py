import os.path
import subprocess
import json

edpy_dir = os.path.join(os.path.dirname(__file__), "EdPy")
examples_dir = os.path.join(os.path.dirname(__file__), "examples")
for name in os.listdir(examples_dir):
    if name.endswith(".py"):
        try:
            out = subprocess.check_output(["python3.8", os.path.join(edpy_dir, "EdPy.py"),
                                           "-a", os.path.join(examples_dir, name + ".asm"),
                                           "en_lang.json", os.path.join(examples_dir, name)],
                                    cwd=edpy_dir)
            result = json.loads(out.decode("utf-8"))
            os.rename(result["wavFilename"], os.path.join(examples_dir, name + ".wav"))
            print("Processed", name)
        except subprocess.CalledProcessError as e:
            print("ERROR %s with %s: %s", e.returncode, name, e.output)
