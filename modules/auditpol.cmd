@echo off
echo.
echo.
echo Setting Audit Logging Policy
echo.
echo.
echo "Setting Account Logon"
auditpol.exe /set /category:"Account Logon" /Success:enable /failure:enable
echo "Setting Logging Logon/Logoff"
auditpol.exe /set /category:"Logon/Logoff" /Success:enable /failure:enable
echo "Setting Account Management"
auditpol.exe /set /category:"Account Management" /Success:enable /failure:enable
echo "Setting DS Access"
auditpol.exe /set /category:"DS Access" /Success:enable /failure:enable
echo "Setting Object Access"
auditpol.exe /set /category:"Object Access" /Success:enable /failure:enable
echo "Setting Policy Change"
auditpol.exe /set /category:"policy change" /Success:enable /failure:enable
echo "Setting Privilage Use"
auditpol.exe /set /category:"Privilege use" /Success:enable /failure:enable
echo "Setting System"
auditpol.exe /set /category:"System" /Success:enable /failure:enable
echo "Setting Process Tracking"
auditpol.exe /set /category:"process tracking" /Success:enable /failure:enable
echo "Wrapping Up Auditpol"
auditpol.exe /set /category:* /success:enable
auditpol.exe /set /category:* /failure:enable

echo.
echo.
echo Setting Audit Password Policy
echo.
echo.
echo "Setting Minimum Password Length (8)"
NET.exe accounts /minpwlen:8
echo "Setting Max Password Length (30)"
NET.exe accounts /maxpwage:30
echo "Setting Unique Password (0)"
NET.exe accounts /uniquepw:0
echo "Setting Minimum Password Age (10)"
NET.exe accounts /minpwage:10
echo "Setting Max Password Age (30)"
NET.exe accounts /maxpwage:30
echo "Setting Force Logoff (60)"
NET.exe accounts /forcelogoff:60
echo "Setting Lock Out Threshold (10)"
NET.exe accounts /lockoutthreshold:10
echo "Setting Lockout Window (4)"
NET.exe accounts /lockoutwindow:4
echo "Setting Lock Out Duration (4)"
NET.exe accounts /lockoutduration:4
echo.
echo.
echo Operation Executed. Make Sure To See For Errors
