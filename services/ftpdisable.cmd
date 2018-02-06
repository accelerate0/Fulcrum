@echo off
echo.
net stop msftpsvc
sc stop "MSFtpsvc"
sc config "MSFtpsvc" start= disabled
sc delete "MSFtpsvc"
echo.
