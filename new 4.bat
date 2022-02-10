@echo off
goto loop

:loop
set "YES=y"
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to continue [y/n]?"
if /i %CONTINUE% == %YES% call :pushToGit %COMMIT_MESSAGE%
if /i NOT %CONTINUE% == %YES% goto loop
echo broken
pause
EXIT /B 1
	
:pushToGit
@echo on
echo Entry being committed with message: "%~1"
call git add .
call git commit -m "%~1"
EXIT /B 0
