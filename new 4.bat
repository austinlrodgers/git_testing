@echo off
set "YES=y"
goto loop

:loop
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to continue [y/n]?"
echo %YES%
echo %CONTINUE%
if (%CONTINUE% == %YES%) (goto pushToGit %COMMIT_MESSAGE%) else (goto loop)
EXIT /B 1
	
:pushToGit
@echo on
echo Entry being committed with message: %~1
PAUSE
call git add .
call git commit %~1
EXIT /B 0

PAUSE
