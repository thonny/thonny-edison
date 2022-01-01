from urllib.request import urlopen
import json
import re
import subprocess


def format_function(name, keywords, html):
    if name.startswith("Ed."):
        name = name[3:]

    print("def " + name, end="")
    # print(html)
    pat = "<h2>(Ed\.)?" + name + "(\(.*?\)).*?</h2>"
    # print(re.findall(pat, html))
    for m in re.finditer(pat, html):
        print(m.group(2), end="")
    print(":")
    start = html.index("<h3>")
    html = html[start:]  # get rid of signature
    rst = html2rst(html)
    print('    """' + rst + '\n"""')
    print()


def html2rst(html):
    p = subprocess.Popen(
        [
            "C:\\Users\\Aivar\\AppData\\Local\\Pandoc\\pandoc.exe",
            "--from",
            "html",
            "--to",
            "rst",
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        shell=False,
        universal_newlines=True,
        encoding="UTF-8",
    )
    stdout, stderr = p.communicate(html)
    if stderr:
        raise RuntimeError(stderr)

    return stdout


with urlopen("http://api.edwareapp.com/help?app=edpy") as f:
    data = json.load(f)
    for item in data["results"]:
        title = item["title"]
        if title.endswith("()"):
            format_function(title[:-2], item["keywords"], item["html"])
            # break
        else:
            "TODO: constant"
