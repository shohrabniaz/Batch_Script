set source_path=E:\
set dest_path=E:\iso
set log_dir=C:\tmp\log

robocopy /MT:16 %source_path% %dest_path% ubuntu-20.04.3-live-server-amd64.iso  /LOG+:%log_dir%/log1.txt

pause