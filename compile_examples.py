import os.path
import subprocess
import json

edpy_dir = os.path.abspath(
    os.path.join(
        os.path.dirname(__file__), "thonnycontrib", "backend", "edison_backend", "EdPy"
    )
)

examples_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "examples"))
for name in os.listdir(examples_dir):
    if name.endswith(".py"):
        try:
            args = [
                "python3.9",
                os.path.join(edpy_dir, "EdPy.py"),
                "-a",
                os.path.join(examples_dir, name + ".asm"),
                "en_lang.json",
                os.path.join(examples_dir, name),
            ]
            out = subprocess.check_output(args, cwd=edpy_dir)
            result = json.loads(out.decode("utf-8"))
            os.rename(result["wavFilename"], os.path.join(examples_dir, name + ".wav"))
            print("Processed", name)
        except subprocess.CalledProcessError as e:
            print("ERROR %s with %s: %s" % (e.returncode, name, e.output))
