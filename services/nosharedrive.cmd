@echo off
REM Disable sharing 0x4 (C Drive)
REM To Disable All Drives Use 0x03FFFFFF
REM More Info Here https://technet.microsoft.com/en-us/library/cc938267.aspx

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /t REG_DWORD /d 0x4 /f
