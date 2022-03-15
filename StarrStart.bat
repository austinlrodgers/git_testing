@echo off

cd /D "C:\Users\wipeo\AppData\Local\Microsoft\Teams"
start Update.exe --processStart "Teams.exe" --process-start-args "--profile=AAD"

cd /D "C:\Program Files (x86)\Microsoft Office\root\Office16\"
start OUTLOOK.EXE

cd /D "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\"
start SelfService.exe -launch -reg "Software\Microsoft\Windows\CurrentVersion\Uninstall\starrcitri-8d6e4c26@@DefaultAggregationGroup._Dev VDI - ATL" -startmenuShortcut
