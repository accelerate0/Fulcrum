@echo off
net stop WebClient
REG add "HKLM\SYSTEM\CurrentControlSet\services\WebClient" /v Start /t REG_DWORD /d 4 /f
