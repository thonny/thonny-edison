rmdir build /s /q

C:\Python36-32\python.exe setup.py bdist_wheel 
C:\Python36-32\python.exe setup.py sdist --formats=gztar 

rmdir build /s /q


pause