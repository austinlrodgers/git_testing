@echo off
call git diff --exit-code --quiet
if %errorlevel%==0 (echo "You have no current changes") else (goto loop)
:endLoop
goto end

:loop
set "YES=y"
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to continue [y/n]?"
if /i %CONTINUE% == %YES% (call :pushToGit "%COMMIT_MESSAGE%") else (goto loop)
goto endLoop

:pushToGit
echo Entry being committed with message: %~1
call git add .
pause
call git commit -m "'%~1'"
pause
call git push origin main
if %errorlevel%==0 (echo "Changes Successfully Committed") else (echo "Error: %errorlevel%)
goto endLoop

:end
pause
EXIT
