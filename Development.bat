@echo off

cd "E:\Development\Booking\"
git.exe fetch --all
call git merge origin/develop

cd "E:\Development\Booking\ui\"
call ng s

pwsh.exe -executionpolicy remotesigned -File  "E:\Batch Files\Development.ps1"