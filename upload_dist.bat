set PATH=C:\Py3\Scripts;%PATH%

twine.exe upload --skip-existing dist\*.whl dist\*.tar.gz
pause