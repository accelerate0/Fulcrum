@echo off
echo.
echo.
echo Enabling firewall...
echo set currentprofile state on 
netsh advfirewall set currentprofile state on 
echo set currentprofile state on 
netsh advfirewall set privateprofile state on
echo set domainprofile state on
netsh advfirewall set domainprofile state on
echo advfirewall set publicprofile state on
netsh advfirewall set publicprofile state on
:: Just incase if it doesn't work
echo set allprofiles state on
netsh advfirewall set allprofiles state on
Set-Service MpsSvc -StartupType Automatic -Status Running
echo.
echo.
