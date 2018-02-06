@echo off
echo.
echo.
Dism /online /Get-Features > features.txt
echo.
:: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/enable-or-disable-windows-features-using-dism
echo Enabled Features
DISM /online /get-features /format:table | find “Enabled” | more
echo.
echo Disable Features
DISM /online /get-features /format:table | find “Disabled” | more
echo.
echo.
