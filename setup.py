from setuptools import setup
import os.path
import sys

setupdir = os.path.dirname(__file__)

requirements = []
for line in open(os.path.join(setupdir, "requirements.txt"), encoding="UTF-8"):
    if line.strip() and not line.startswith("#"):
        requirements.append(line)

setup(
    name="thonny-edison",
    version="1.0.0",
    description="A plug-in which adds Edison robot support for Thonny",
    long_description="""Plug-in for Thonny which adds Edison robot support.
 
More info: https://github.com/thonny/thonny-edison/""",
    url="https://github.com/thonny/thonny-edison/",
    author="Aivar Annamaa",
    license="GPL",
    classifiers=[
        "Environment :: MacOS X",
        "Environment :: Win32 (MS Windows)",
        "Environment :: X11 Applications",
        "Intended Audience :: Developers",
        "Intended Audience :: Education",
        "Intended Audience :: End Users/Desktop",
        "License :: Freeware",
        "License :: OSI Approved :: GNU General Public License (GPL)",
        "Natural Language :: English",
        "Operating System :: MacOS",
        "Operating System :: Microsoft :: Windows",
        "Operating System :: POSIX",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3 :: Only",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Topic :: Education",
        "Topic :: Software Development",
    ],
    keywords="IDE education programming robotics Edison",
    platforms=["Windows", "macOS", "Linux"],
    python_requires=">=3.5",
    package_data={
        "thonnycontrib.edison": ["res/*"],
        "thonnycontrib.backend.edison_backend": ["EdPy/*.py", "EdPy/*.json", "EdPy/LICENSE", "EdPy/lib/*.py"]
    },
    install_requires=requirements,
    py_modules=["Ed"],
    packages=["thonnycontrib.edison", "thonnycontrib.backend.edison_backend"],
)
