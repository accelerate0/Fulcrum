@echo off
:: Disables Sticky Keys
reg ADD "HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
IF %ERRORLEVEL% EQU 0 echo Operation Executed || echo An Error Occured
echo.
