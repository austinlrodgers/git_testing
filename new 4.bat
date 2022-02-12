@echo off
call git diff --exit-code --quiet
echo %errorlevel%
pause
if (%errorlevel%==0) (echo "You have no current changes";) else (goto loop)
pause
goto end

:loop
set "YES=y"
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to continue [y/n]?"
if /i %CONTINUE% == %YES% (call :pushToGit %COMMIT_MESSAGE%) else (goto loop)
EXIT /B 0
	
:pushToGit
@echo on
echo Entry being committed with message: "%~1"
call git add .
call git commit -m "%~1"
call git push origin main
EXIT /B 0

:end
EXIT /B 0
