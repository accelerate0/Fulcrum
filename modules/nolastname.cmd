@echo off
::Do not display last user on logon
reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v dontdisplaylastusername /t REG_DWORD /d 1 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo.
