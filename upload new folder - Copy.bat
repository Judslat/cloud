@echo off
REM Batch script to add all subfolders inside a parent folder, commit, and push

SET /P parentfolder=Enter parent folder (e.g., fly): 

IF NOT EXIST "%parentfolder%" (
    ECHO Folder "%parentfolder%" does not exist!
    GOTO :EOF
)

REM Loop through each subfolder inside the parent folder
FOR /D %%F IN ("%parentfolder%\*") DO (
    ECHO Adding folder %%F...
    git add "%%F"
)

REM Optionally, add the parent folder itself in case it has files directly
git add "%parentfolder%"

git commit -m "Add/Update folders inside %parentfolder%"
git push

ECHO Done! All subfolders in "%parentfolder%" have been pushed to GitHub.
pause

