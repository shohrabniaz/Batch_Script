@echo off 

set hour=%time: =0%
set date_time=%date:~7,2%_%date:~4,2%_%date:~10,4%@%hour:~0,2%_%time:~3,2%_%time:~6,2%

set script_root_path=%~dp0
for %%I in ("%script_root_path%\..") do set "source_path=%%~fI"

IF NOT EXIST %source_path%\jar_war_file (
	md %source_path%\jar_war_file\
)


md D:\DassaultSystemes\

set root_path=D:\DassaultSystemes\
md  %root_path%R2021x\3DSpace\win_b64\code\

set tomee_path=%root_path%R2021x\3DSpace\win_b64\code\

rem md %tomee_path%tomee\webapps\3dspace\webapps
rem md %tomee_path%tomee1\webapps\3dspace\webapps
rem md %tomee_path%tomee2\webapps\3dspace\webapps
rem md %tomee_path%tomee3\webapps\3dspace\webapps
rem md %tomee_path%tomee4\webapps\3dspace\webapps

SET number_of_tomee=4
FOR /L %%A IN (1,1,%number_of_tomee%) DO (
    IF NOT EXIST %tomee_path%tomee%%A (
		md %tomee_path%tomee%%A\webapps\3dspace\webapps
		xcopy %source_path%\ci_cd_pipeline.* %tomee_path%tomee%%A\webapps\3dspace\webapps /c /i /y
	)
)


rem taking the backup of the webapps location file into tomee_backup file location
IF EXIST %tomee_path%tomee (
    Robocopy /MIR %tomee_path%tomee\webapps\3dspace\webapps %source_path%\tomee_backup\%date_time%\ ci_cd_pipeline.*
)

FOR /L %%A IN (1,1,%number_of_tomee%) DO (
    IF EXIST %tomee_path%tomee%%A (
		Robocopy /MIR %tomee_path%tomee%%A\webapps\3dspace\webapps %source_path%\tomee_backup\%date_time%\ ci_cd_pipeline.*
	)
)

rem copy the war/jar/text file into webapps location
IF EXIST %tomee_path%tomee (
	Robocopy /MIR %source_path%\jar_war_file %tomee_path%tomee\webapps\3dspace\webapps SampleWebApp.*
	
)

FOR /L %%A IN (1,1,%number_of_tomee%) DO (
    IF EXIST %tomee_path%tomee%%A (
		Robocopy /MIR %source_path%\jar_war_file %tomee_path%tomee%%A\webapps\3dspace\webapps SampleWebApp.*
	)
)

pause

