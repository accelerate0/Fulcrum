@echo off
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" /v TurnOffSidebar /t REG_DWORD /d 1 /f
