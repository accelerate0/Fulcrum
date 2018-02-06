@echo off
echo.
net stop SharedAccess
	sc stop SharedAccess
	sc config SharedAccess start= disabled
sc delete SharedAccess
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
REG add "HKLM\SYSTEM\CurrentControlSet\services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
echo.
