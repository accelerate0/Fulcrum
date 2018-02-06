@echo off
echo Showing super hidden files...
reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo Hidden Files And Directories Are Now Exposed!
echo.
