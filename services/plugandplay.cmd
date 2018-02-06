@echo off
net stop PlugPlay
REG add "HKLM\SYSTEM\CurrentControlSet\services\PlugPlay" /v Start /t REG_DWORD /d 4 /f
