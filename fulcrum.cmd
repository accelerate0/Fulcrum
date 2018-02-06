@setlocal enableextensions enabledelayedexpansion
@echo off

:ini
:: ==============================
:: ==============================
:: Set Window Size
mode con: cols=100 lines=50
:: Set The Title
title Fulcrum
::
echo.
echo.
echo.
:::
:::

:: Initial Messages:
echo Logged In As User %USERNAME%
echo Type 'help' For Commands
echo Remember To Restart The Computer To Make Changes
echo.
echo WARNING
echo This Current Version Will Only Run CMD Plugins and Not Powershell!
echo.
echo.
goto :menu


:menu :: The Main Framework aka Menu Terminal

:: Set Directory
cd %~dp0
:: Set Input
set "INPUT="
set /P INPUT=%USERNAME%@Fulcrum:~$
if /I "%INPUT%" EQU "help" goto :help

:: MENU Commands ==================================================

:: Check For Invalid Commands, currently this is bugged so going to add once it is fixed
::
:: @setlocal enableDelayedExpansion
:: echo(!INPUT!|findstr /rx "D[0123456789]*" >nul && (
::   goto :command
::      ) || (
REM Test
REM Currently This is Broken
::  goto :command
::  )

:command
:: For Executing Filename via call
:: I could have just done with dir then variable, but this is an addon for later incase if I want to implement sub commands

FOR /F "tokens=* USEBACKQ" %%F IN (`@echo %INPUT%`) DO (
SET F=%%F
)
goto :modules

:: See If It Exists
:modules
cd %~dp0modules
dir /s/b %F%.cmd > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0modules
    call %F%.cmd
      goto :menu
) ELSE (
  cd %~dp0modules
  dir /s/b %F%.ps1 > nul 2>&1
  If %ERRORLEVEL% EQU 0 (
      cd %~dp0modules
      call %F%.ps1
        goto :menu
  ) ELSE (
  goto :services
)

:services
cd %~dp0services
dir /s/b %F%.cmd > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0services
    call %F%.cmd
      goto :menu
) ELSE (
  cd %~dp0services
  dir /s/b %F%.ps1 > nul 2>&1
  If %ERRORLEVEL% EQU 0 (
      cd %~dp0services
      call %F%.ps1
        goto :menu
  ) ELSE (
  goto :utilities
)

:utilities
cd %~dp0utilities
dir /s/b %F%.cmd > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0utilities
    call %F%.cmd
      goto :menu
) ELSE (
  cd %~dp0utilities
  dir /s/b %F%.ps1 > nul 2>&1
  If %ERRORLEVEL% EQU 0 (
      cd %~dp0utilities
      call %F%.ps1
        goto :menu
  ) ELSE (
  goto :alpha
)

:alpha
cd %~dp0alpha
dir /s/b %F%.cmd > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0alpha
    call %F%.cmd
      goto :menu
) ELSE (
  cd %~dp0alpha
  dir /s/b %F%.ps1 > nul 2>&1
  If %ERRORLEVEL% EQU 0 (
      cd %~dp0alpha
      call %F%.ps1
        goto :menu
  ) ELSE (
  goto :api
)




:api
cd %~dp0api
dir /s/b %F%.cmd > nul 2>&1
If %ERRORLEVEL% EQU 0 (
    cd %~dp0api
    call %F%.cmd
      goto :menu
) ELSE (
  cd %~dp0api
  dir /s/b %F%.ps1 > nul 2>&1
  If %ERRORLEVEL% EQU 0 (
      cd %~dp0api
      call %F%.ps1
        goto :menu
  ) ELSE (
  goto :othercommand
)


:othercommand
cd %~dp0
If %F%.cmd = stig.command (
call %F%.cmd
  goto :menu
) ELSE (goto :nocommand)




:: Incase The Above Fails
:: Purely For Bug Testing
:criticalerror
echo.
echo Warning
echo A critical error has occured
echo.
goto :menu

:: Class For Unknown Commands
:nocommand
echo Unknown Command
goto :menu

:: Help Command
:help
echo.
echo.
echo =Modules=
:: List Modules
for /R %~dp0modules %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo =Services=
:: List Stigs
for /R %~dp0services %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo =API=
:: List API
for /R %~dp0api %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo =Utilities=
:: List Scanner
for /R %~dp0utilities %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo =Alpha=
:: List Alpha
for /R %~dp0alpha %%f in (*.cmd) do (
echo %%~nf
)
echo.
echo stig - To run all stigs
echo.
echo.
:: Go Back
goto :menu
