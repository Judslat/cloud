@echo off
setlocal enabledelayedexpansion

echo.
echo ===============================
echo   Git Folder Manager
echo ===============================
echo.
echo 1) Add folder (and subfolders) to Git
echo 2) Remove folder from Git AND delete locally
echo 3) Untrack folder (keep on PC, remove from GitHub)
echo.
set /P choice=Choose an option (1-3): 

echo.
set /P folder=Enter folder name (e.g., fly): 

IF NOT EXIST "%folder%" (
    echo Folder "%folder%" does not exist!
    pause
    goto :EOF
)

IF "%choice%"=="1" goto ADD
IF "%choice%"=="2" goto REMOVE
IF "%choice%"=="3" goto UNTRACK

echo Invalid choice!
pause
goto :EOF

:ADD
echo.
echo Adding "%folder%" to Git...
git add "%folder%"
git commit -m "Add or update folder %folder%"
git push
goto DONE

:REMOVE
echo.
echo WARNING: This will DELETE "%folder%" locally and from GitHub!
echo Press CTRL+C to cancel or any key to continue...
pause >nul
git rm -r "%folder%"
git commit -m "Remove folder %folder%"
git push
goto DONE

:UNTRACK
echo.
echo This will REMOVE "%folder%" from GitHub but KEEP it on your PC.
echo Press CTRL+C to cancel or any key to continue...
pause >nul

git rm -r --cached "%folder%"
git commit -m "Stop tracking folder %folder%"
git push

echo.
set /P ignore=Add "%folder%/" to .gitignore? (Y/N): 

IF /I "%ignore%"=="Y" (
    IF NOT EXIST .gitignore (
        echo Creating .gitignore...
        echo %folder%/ > .gitignore
    ) ELSE (
        findstr /I "^%folder%/$" .gitignore >nul
        IF ERRORLEVEL 1 (
            echo Adding %folder%/ to .gitignore...
            echo %folder%/>> .gitignore
        ) ELSE (
            echo %folder%/ already exists in .gitignore
        )
    )

    git add .gitignore
    git commit -m "Ignore folder %folder%"
    git push
)

goto DONE

:DONE
echo.
echo Done!
pause
