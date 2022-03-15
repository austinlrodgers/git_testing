echo "Initial GhostDraft repos setup"

set /p NAME="What is your first and last name?"
set /p EMAIL="What is your Starr Companies email address?

call git config --global user.name "%NAME%"
call git config --global user.email %EMAIL%
@pause