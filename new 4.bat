@echo off
goto loop

:loop
set "YES=y"
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to continue [y/n]?"
if /i NOT %CONTINUE% == %YES% goto loop
call :pushToGit %COMMIT_MESSAGE%
EXIT /B 1
	
:pushToGit
echo Entry being committed with message: "%~1"
call git add .
call git commit -m "%~1"
call git push -u origin main
EXIT /B 0
	