@echo off
::Disable dump file creation
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v CrashDumpEnabled /t REG_DWORD /d 0 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
