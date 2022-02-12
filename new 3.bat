@echo on
set "EXIT_CODE=call git diff --exit-code"
echo %EXIT_CODE%
pause
if NOT call git diff --exit-code == 0 echo Hello World
pause