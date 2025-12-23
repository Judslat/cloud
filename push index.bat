@echo off
REM Batch script to commit and push a new index.html file in a folder

SET /P foldername=Enter folder name containing index.html: 

IF NOT EXIST "%foldername%\index.html" (
    ECHO index.html not found in "%foldername%"!
    GOTO :EOF
)

git add "%foldername%\index.html"
git commit -m "Update index.html in %foldername%"
git push

ECHO Done! Updated index.html in "%foldername%" has been pushed.
pause
