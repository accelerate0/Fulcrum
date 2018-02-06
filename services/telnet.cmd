@echo off
echo.
echo "Disabling Telnet"
net stop telnet
sc config tlntsvr start= disabled
sc delete telnet

::Experimental
::start /w pkgmgr /uu:TelnetClient
::start /w pkgmgr /uu:TelnetServer
dism /online /Disable-Feature /FeatureName:TelnetClient
dism /online /Disable-Feature /FeatureName:TelnetServer
