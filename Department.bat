@echo off
Set /P _department=Please enter Department: 

If /i "%_department%"=="DevOps" goto DevOps
If /i "%_department%"=="Software" goto Software
goto:eof

:DevOps
echo You have chosen the DevOps department
goto:eof

:Software
echo You have chosen the Software department
goto:eof