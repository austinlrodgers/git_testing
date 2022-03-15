echo "Initial GhostDraft repos setup"

set /p NAME="What is your first and last name?"
set /p EMAIL="What is your Starr Companies email address?

call git config --global user.name "%NAME%"
call git config --global user.email %EMAIL%
call git config --global http.sslVerify false

cd C:\
md Projects
cd Projects
md GhostDraft
cd Ghostdraft

call git clone https://StarrCo@dev.azure.com/StarrCo/GhostDraft/_git/RuleBook
cd "RuleBook"
call git checkout develop
call git pull
cd ..
call git clone https://StarrCo@dev.azure.com/StarrCo/GhostDraft/_git/BLUE-PolicyForms
cd "BLUE-PolicyForms"
call git checkout develop
call git pull
cd ..
call git clone https://StarrCo@dev.azure.com/StarrCo/GhostDraft/_git/BLUE-QuoteLetter
cd "BLUE-QuoteLetter"
call git checkout develop
call git pull
@PAUSE