@echo off

REM Ask About https://technet.microsoft.com/en-us/library/dd835564(v=ws.10).aspx





::Enable UAC
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
::UAC setting (Prompt on Secure Desktop)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f
::UAC setting (Prompt on Admin Desktop)
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f







Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "3" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "legalnoticecaption" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "legalnoticetext" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "scforceoption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownwithoutlogon" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "undockwithoutlogon" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_TEXT" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_BITMAP" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_OEMTEXT" /t REG_DWORD /d "7" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_DIB" /t REG_DWORD /d "8" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_PALETTE" /t REG_DWORD /d "9" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_UNICODETEXT" /t REG_DWORD /d "13" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UIPI\Clipboard\ExceptionFormats" /v "CF_DIBV5" /t REG_DWORD /d "17" /f


