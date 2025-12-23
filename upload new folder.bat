@echo off
REM Batch script to add a folder to git, commit, and push

SET /P foldername=Enter folder name to add: 

IF NOT EXIST "%foldername%" (
    ECHO Folder "%foldername%" does not exist!
    GOTO :EOF
)

git add "%foldername%"
git commit -m "Add %foldername% folder with content"
git push

ECHO Done! Folder "%foldername%" has been pushed to GitHub.
pause
