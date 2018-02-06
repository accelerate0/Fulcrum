
@echo off
echo.

if exist "%ProgramFiles%\Windows Defender\MpCmdRun.exe" goto :windef || goto :missingdef


:windef
echo.
echo Restoring Windows Defender To Default Settings
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -RestoreDefaults
echo.

echo Updating Windows Defender
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate
echo.
goto :done

:missingdef
echo MpCmdRun.exe is unavailable
echo.

:done
echo Operation Executed
echo.
