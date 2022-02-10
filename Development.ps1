$ROOT = "C:\Program Files\Microsoft VS Code\bin"
$FILE_PATH = "code.cmd"
$VERB = "RunAs"

Start-Process -FilePath $FILE_PATH -WorkingDirectory $ROOT -Verb $VERB

$ROOT = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\"
$FILE_PATH = "devenv.exe"

Start-Process -FilePath $FILE_PATH -WorkingDirectory $ROOT -Verb $VERB
