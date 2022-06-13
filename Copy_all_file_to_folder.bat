set source_path=D:\test
set dest_path=E:\here
set log_dir=C:\tmp\log

robocopy %source_path% %dest_path% /LOG+:%log_dir%/log.txt

pause