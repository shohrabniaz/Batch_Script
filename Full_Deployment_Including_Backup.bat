@echo off
setlocal

rem Please varify the following two path
set backup_file_location=G:\DassaultSystemes
set mcs_dir=G:\DassaultSystemes\R2018x\3DSpace

set hour=%time: =0%
set datetime=%date:~4,2%-%date:~7,2%-%date:~10,4%_%hour:~0,2%-%time:~3,2%-%time:~6,2%
set number_of_instances=10
set script_path=%~dp0
set app_root_dir_path=%mcs_dir%\STAGING\ematrix\
set instance_dir_path=%mcs_dir%\win_b64\code\
set log_path=%~dp0\log.txt


Robocopy /MIR %app_root_dir_path%WEB-INF\lib %backup_file_location%\Translation_Management_backup\%datetime%\jar EnoviaRESTService18x.jar /LOG+:%log_path%

Robocopy /MIR %app_root_dir_path%webapps\TranslationWidget %backup_file_location%\Translation_Management_backup\%datetime%\TranslationWidget /LOG+:%log_path%

for %%I in ("%script_path%\..") do set "source_path=%%~fI"

Robocopy /MIR %source_path%\resource\lib %app_root_dir_path%WEB-INF\lib EnoviaRESTService18x.jar /LOG+:%log_path%
Robocopy /MIR %source_path%\TranslationWidget %app_root_dir_path%webapps\TranslationWidget /LOG+:%log_path%


IF EXIST %instance_dir_path%tomee (
    Robocopy /MIR %source_path%\resource\lib %instance_dir_path%tomee\webapps\3dspace\WEB-INF\lib EnoviaRESTService18x.jar /LOG+:%log_path%
    Robocopy /MIR %source_path%\TranslationWidget %instance_dir_path%tomee\webapps\3dspace\webapps\TranslationWidget /LOG+:%log_path%
)

FOR /L %%A IN (1,1,%number_of_instances%) DO (
    IF EXIST %instance_dir_path%tomee%%A (
        Robocopy /MIR %source_path%\resource\lib %instance_dir_path%tomee%%A\webapps\3dspace\WEB-INF\lib EnoviaRESTService18x.jar /LOG+:%log_path%
        Robocopy /MIR %source_path%\TranslationWidget %instance_dir_path%tomee%%A\webapps\3dspace\webapps\TranslationWidget /LOG+:%log_path%
	)
)
@echo:
@echo:
echo  SUCCESS: Deployment Done,Check Log For Details...
@echo:
@echo:
pause