@echo off
setlocal enabledelayedexpansion

set "currentFolder=%~dp0"
set "outputFile=%currentFolder%allAudio.txt"
set "audioFileTypes=.mp3 .wav .ogg"  REM Add or remove audio file extensions as needed

rem Clear the contents of the output file, if it already exists
if exist "%outputFile%" del "%outputFile%"

rem Loop through files in the current folder
for %%F in ("%currentFolder%*.*") do (
    set "fileExtension=%%~xF"
    
    rem Check if the file is an audio file (in the list of audio file types)
    for %%A in (%audioFileTypes%) do (
        if /i "!fileExtension!" equ "%%A" (
            echo %%~nxF >> "%outputFile%"
        )
    )
)

echo Audio file list has been saved to %outputFile%
