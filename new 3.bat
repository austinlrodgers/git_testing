call git diff --exit-code --quiet
if (%errorlevel%==0) (echo "You have no current changes";) else (echo "You have changes")
pause