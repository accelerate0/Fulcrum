@echo off


:checkadmin
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    goto :yes
) ELSE (
    goto :no
)


:no
cd %~dp0
echo You Are Not Running This With Admin Privilages And It Requires Admin Privilages
pause
exit

:yes
cd %~dp0
echo Running With Administrative Privilage


setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto :w10
if "%version%" == "6.3" goto :w8
if "%version%" == "6.2" goto :w8
if "%version%" == "6.1" goto :w7
if "%version%" == "6.0" goto :vista
endlocal

:w10
echo This Program Is Fully Supported With This Windows Version
echo Press Any Key To Exit And Start A New Window In PowerShell
pause > NUL
start PowerShell -NoExit -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoExit -ExecutionPolicy Bypass -File "".\fulcrum.ps1""' -Verb RunAs}"
exit

:w8
goto :choice
:w7
goto :choice


:vista
echo This Program Is Not Supported On This Windows Version
echo Click To Exit
pause > NUL
exit


:choice
echo This Program Is Partially Supported With This Windows Version
echo Would You Like To
echo        Run it in powershell [1] Windows 8 Recommend
echo        Run it in batch [2] Windows 7 Recommend
set /P c=Choose [1/2]
if /I "%c%" EQU "1" goto :ps
if /I "%c%" EQU "2" goto :cmd
goto :choice

:ps
echo Press Any Key To Exit And Start A New Window In PowerShell
pause > NUL
start PowerShell -NoExit -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoExit -ExecutionPolicy Bypass -File "".\fulcrum.ps1""' -Verb RunAs}"
exit



:cmd
clear
call "fulcum.cmd"
