@echo off

set hour=%time: =0%

set datetime=%date:~10,4%-%date:~4,2%-%date:~7,2%_%hour:~0,2%-%time:~3,2%-%time:~6,2%


rem create Backup Folder

set backup_file_location=C:\Users\USER\Desktop\tmp\cert1

rem backup existing file
Robocopy C:\Users\USER\Desktop\tmp\cert %backup_file_location% /MIR

pause