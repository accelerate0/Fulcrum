@echo off
net stop NetTcpPortSharing
REG add "HKLM\SYSTEM\CurrentControlSet\services\NetTcpPortSharing" /v Start /t REG_DWORD /d 4 /f
