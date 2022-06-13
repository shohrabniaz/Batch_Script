set source_path1=D:\test\Data\Data1
set source_path2=D:\test\Data\Data2
set dest_path=E:\here
set log_dir=C:\tmp\log

robocopy %source_path1% %dest_path% /LOG+:%log_dir%/log1.txt
robocopy %source_path2% %dest_path% /LOG+:%log_dir%/log2.txt


pause