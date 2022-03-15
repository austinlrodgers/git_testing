@echo off
set "FORMS=F"
set "QUOTE_LETTER=Q"
set QUOTE_LETTER_DIR="C:\Projects\Ghostdraft\QuoteLetter"
set FORMS_DIR="C:\Projects\Ghostdraft\Forms"

call :entryPoint

:entryPoint
goto getRepoSelection

cd dir
call git diff --exit-code --quiet
if %errorlevel%==0 (echo "You have no current changes") else (goto loop)
:endLoop
goto end

:loop
set "YES=y"
set "COMMIT_MESSAGE="
set "CONTINUE="
set /p COMMIT_MESSAGE="Please enter commit message: "
set /p CONTINUE="Your message is: %COMMIT_MESSAGE%. Do you want to  [y/n]?"
if /i %CONTINUE% == %YES% (call :pushToGit "%COMMIT_MESSAGE%") else (goto loop)
goto endLoop

:pushToGit
echo Entry being committed with message: %~1
call git add .
call git commit -m "%~1"
call git push origin develop
echo "Changes Successfully Committed"
goto endLoop

:getRepoSelection
set dir=""

set /p REPO_SELECTION="Are you making QuoteLetter(Q) or Forms(F) changes?"

if /i %REPO_SELECTION% == %FORMS% (set dir="%FORM_DIR%")
if /i %REPO_SELECTION% == %QUOTE_LETTER% (set dir="%QUOTE_LETTER_DIR%")
if /i not %REPO_SELECTION% == %FORMS% && not %REPO_SELECTION% == %QUOTE_LETTER% (goto :getRepoSelection)


:end
pause
EXIT
