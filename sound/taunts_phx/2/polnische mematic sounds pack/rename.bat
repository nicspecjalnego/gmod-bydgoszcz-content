@echo off
setlocal enabledelayedexpansion

set "currentFolder=%~dp0"
set "csvFilePath=%currentFolder%files.csv"

for /f "usebackq tokens=1,2 delims=," %%a in ("%csvFilePath%") do (
    set "oldFileName=%%a"
    set "newFileName=%%b"
    
    set "oldFilePath=%currentFolder%!oldFileName!"
    set "newFilePath=%currentFolder%!newFileName!"

    if exist "!oldFilePath!" (
        ren "!oldFilePath!" "!newFileName!"
        echo Renamed !oldFileName! to !newFileName!
    ) else (
        echo File not found: !oldFileName!
    )
)

echo File renaming completed.
