@echo off
REM Batch script to commit and push a new index.html file in a folder

SET /P foldername=Enter folder name containing index.html: 

IF NOT EXIST "%foldername%\pano.html" (
    ECHO pano.html not found in "%foldername%"!
    GOTO :EOF
)

git add "%foldername%\pano.html"
git commit -m "Update pano.html in %foldername%"
git push

ECHO Done! Updated pano.html in "%foldername%" has been pushed.
pause
