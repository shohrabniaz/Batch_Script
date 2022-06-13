@echo off

setlocal

:repeat
    SET /P Expr="Please enter your calculation (or 'e') to quit:"
    SET /A Result=%Expr%
    if "%Expr%"==""  goto :eof
    if "%Expr%"=="e" goto :eof
    echo The result is %Result%
    goto repeat
	
pause