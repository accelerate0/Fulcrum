@echo off
net stop RemoteRegistry
sc delete RemoteRegistry

sc stop "Remote Registry"
sc config "Remote Registry" start=disabled


REG add "HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 4 /f
