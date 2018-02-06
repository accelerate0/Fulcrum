@echo off
:: List of Stigs
:: Delimit each stig by


:: SKIPPED/Already Done
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3380
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26478
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26476
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26473
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26472
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26471
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26470
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26533
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26547
::https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3245
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-16006
::https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26503
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26501
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1168
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26505
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26504
::https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1088
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26469
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1080
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-6836
::https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1155
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1099
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1098
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-2372
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1097
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-42420
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1119
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14271
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26541

:: Original STIGS

:: https://www.stigviewer.com/stig/windows_8/2013-02-15/finding/V-4443
reg add "HKLM\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\" /v Machine /t REG_MULTI_SZ /d "Software\Microsoft\OLAP Server"\0"Software\Microsoft\Windows NT\CurrentVersion\Perflib"\0"Software\Microsoft\Windows NT\CurrentVersion\Print"\0"Software\Microsoft\Windows NT\CurrentVersion\Windows"\0"System\CurrentControlSet\Control\ContentIndex"\0"System\CurrentControlSet\Control\Print\Printers"\0"System\CurrentControlSet\Control\Terminal Server"\0"System\CurrentControlSet\Control\Terminal Server\UserConfig"\0"System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration"\0"System\CurrentControlSet\Services\Eventlog"\0"System\CurrentControlSet\Services\Sysmonlog"\0 /f






:: V-63759
REM Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access.
REM This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously", both of which must be blank under other requirements.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\" /v RestrictNullSessAccess /t REG_DWORD /d 1 /f

:: stig ID V-63749
:: Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.
:: Restrict Anonymous Enumeration #1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v RestrictAnonymous /t REG_DWORD /d 1 /f
:: Restrict Anonymous Enumeration #2
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymoussam /t REG_DWORD /d 1 /f
:: Auditing access of Global System Objects
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v auditbaseobjects /t REG_DWORD /d 1 /f
:: Auditing Backup and Restore
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v fullprivilegeauditing /t REG_DWORD /d 1 /f
:: Disable storage of domain passwords
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v disabledomaincreds /t REG_DWORD /d 1 /f
:: Take away Anonymous user Everyone permissions
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v everyoneincludesanonymous /t REG_DWORD /d 0 /f
:: Allow Machine ID for NTLM
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v UseMachineId /t REG_DWORD /d 0 /f

::V-63667
REM Autoplay must be turned off for non-volume devices.
REM Allowing autoplay to execute may introduce malicious code to a system.
REM Autoplay begins reading from a drive as soon as you insert media in the drive. As a result, the setup file of programs or music on audio media may start.
REM This setting will disable autoplay for non-volume devices (such as Media Transfer Protocol (MTP) devices).
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer\" /v NoAutoplayfornonVolume /t REG_DWORD /d 1 /f
:: V-63673
REM Autoplay must be disabled for all drives.
REM Allowing autoplay to execute may introduce malicious code to a system.
REM Autoplay begins reading from a drive as soon as you insert media in the drive.
REM As a result, the setup file of programs or music on audio media may start.
REM By default, autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives.
REM If you enable this policy, you can also disable autoplay on all drives.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\" /v NoDriveTypeAutoRun /t REG_DWORD /d 255
:: V-63671
REM The default autorun behavior must be configured to prevent autorun commands.
REM Allowing autorun commands to execute may introduce malicious code to a system.
REM Configuring this setting prevents autorun commands from executing.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer\" /v NoAutoRun /t REG_DWORD /d 1
reg add "HKCU\SYSTEM\CurrentControlSet\Services\CDROM" /v AutoRun /t REG_DWORD /d 1 /f

:: Restrict CD ROM drive
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-17373
:: V-17373
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateCDRoms /t REG_DWORD /d 1 /f

:: V-1173
:: Windows system maintains a global list of shared system resources such as DOS device names, mutexes, and semaphores. Each type of object is created with a default DACL that specifies who can access the objects with what permissions. If this policy is enabled, the default DACL is stronger, allowing non-admin users to read shared objects, but not modify shared objects that they did not create.
reg ADD "HKLM\System\CurrentControlSet\Control\Session Manager\" /v ProtectionMode /t REG_DWORD /d 1 /f

:: V-15714
:: This check verifies that Error Reporting events will be logged in the system event log.
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15714
reg ADD "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting\" /v LoggingDisabled /t REG_DWORD /d 0 /f

:: V-15718
:: This check verifies that heap termination on corruption is disabled. This may prevent Windows Explorer from terminating immediately from certain legacy plug-in applications.
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15718
reg ADD "HKLM\Software\Policies\Microsoft\Windows\Explorer\" /v NoHeapTerminationOnCorruption /t REG_DWORD /d 0 /f

REM Stig ID: V-63325
REM Desc: Standard user accounts must not be granted elevated privileges.
REM Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v AlwaysInstallElevated /t REG_DWORD /d 0 /f
REM https://www.stigviewer.com/stig/windows_7/2015-06-24/finding/V-16008
REM Stig-ID: V-16008
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v ValidateAdminCodeSignatures /t REG_DWORD /d 0 /f

:: V-14232
:: This check verifies that Windows is configured to limit IPSec exemptions.
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14232
reg ADD "HKLM\System\CurrentControlSet\Services\IPSEC\" /v NoDefaultExempt /t REG_DWORD /d 1 /f

:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1153
:: V-1153
reg ADD "HKLM\System\CurrentControlSet\Control\Lsa\" /v LmCompatibilityLevel /t REG_DWORD /d 5 /f

REM Stig ID: V-63797
REM The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords.
REM This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\" /v NoLMHash /t REG_DWORD /d 1 /f

REM stig ID V-63801
REM The Kerberos v5 authentication protocol is the default for authentication of users who are logging on to domain accounts. NTLM, which is less secure, is retained in later Windows versions for compatibility with clients and servers that are running earlier versions of Windows or applications that still use it. It is also used to authenticate logons to stand-alone computers that are running later versions.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\" /v LmCompatibilityLevel /t REG_DWORD /d 5 /f

::Limit use of blank passwords
::https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3344
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f

:: V-1159
:: This is a Category 1 finding because if this option is set, the Recovery Console does not require you to provide a password and will automatically log on to the system, giving administrator access to system files. By default, the Recovery Console requires you to provide the password for the administrator account before accessing the system.
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1159
reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\" /v SecurityLevel /t REG_DWORD /d 0 /f

REM stig ID V-63809
REM If this option is enabled, the Recovery Console does not require a password and automatically logs on to the system. This could allow unauthorized administrative access to the system.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\" /v SecurityLevel /t REG_DWORD /d 0 /f

:: V-15719
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15719
:: This check verifies that the user is notified whether the logon server was accessible or cached credentials were used.
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v ReportControllerMissing /t REG_DWORD /d 1 /f

REM stig ID V-68849
REM Attackers are constantly looking for vulnerabilities in systems and applications. Structured Exception Handling Overwrite Protection (SEHOP) blocks exploits that use the Structured Exception Handling overwrite technique, a common buffer overflow attack.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\" /v DisableExceptionChainValidation /t REG_DWORD /d 0 /f

REM https://www.stigviewer.com/stig/windows_server_2012_2012_r2_member_server/2015-06-16/finding/V-57657
REM V-57657
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v CrashOnAuditFail /t REG_DWORD /d 1 /f

REM Stig ID: V-63651
REM Remote assistance allows another user to view or take control of the local session of a user.
REM Solicited assistance is help that is specifically requested by the local user.
REM This may allow unauthorized parties access to the resources on the computer.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\" /v fAllowToGetHelp /t REG_DWORD /d 0 /f

:: V-15687
:: Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system. This setting prevents users from being presented with Privacy and Installation options on first use of Windows Media Player, which could enable some communication with the vendor.
reg ADD "HKLM\Software\Policies\Microsoft\WindowsMediaPlayer\" /v GroupPrivacyAcceptance /t REG_DWORD /d 1 /f

REM stig ID V-63347
REM Basic authentication uses plain text passwords that could be used to compromise a system.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\" /v AllowBasic /t REG_DWORD /d 0 /f
REM stig ID V-63335
REM Basic authentication uses plain text passwords that could be used to compromise a system.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\" /v AllowBasic /t REG_DWORD /d 0 /f


:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14259
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v DisableHTTPPrinting /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26576
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\IPHTTPS\IPHTTPSInterface\" /v IPHTTPS_ClientState /t REG_DWORD /d 3 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26577
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\" /v ISATAP_State /t REG_SZ /d Disabled /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26575
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\" /v 6to4_State /t REG_SZ /d Disabled /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3385
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Kernel\" /v ObCaseInsensitive /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3383
reg add "HKLM\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\" /v Enabled /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3381
reg add "HKLM\System\CurrentControlSet\Services\LDAP\" /v LDAPClientIntegrity /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3469
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\system\" /v DisableBkGndGroupPolicy /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14258
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v DisableContentFileUpdates /t REG_DWORD /d 1 /f
:: ===== ::
:: GADGETS
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15725
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar\" /v OverrideMoreGadgetsLink /t REG_SZ /d "about:blank" /f
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15724
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar\" /v TurnOffUnsignedGadgets /t REG_DWORD /d 1 /f
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15726
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Windows\Sidebar\" /v TurnOffUserInstalledGadgets /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15727
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\" /v NoInPlaceSharing /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15722
reg add "HKLM\Software\Policies\Microsoft\WMDRM\" /v DisableOnline /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14236
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-16008
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v ValidateAdminCodeSignatures /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3666
reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0\" /v NTLMMinServerSec /t REG_DWORD /d 0x20080000 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1164
reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\" /v SignSecureChannel /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1166
reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\" /v EnableSecuritySignature /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1163
reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\" /v SealSecureChannel /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1162
reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters\" /v EnableSecuritySignature /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3471
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\" /v DoReport /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3470
:: USERS NEED FIXING ACCORDING TO USERS
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\" /v fAllowUnsolicited /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\ RAUnsolicit\" /v Administrators /t REG_SZ /d Administrators /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\ RAUnsolicit\" /v TestUser /t REG_SZ /d TestUser /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1089
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v LegalNoticeText /t REG_SZ /d "This is property of USA government any hackas can go to neverland" /f
:: ===== ::

:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3479
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\" /v SafeDllSearchMode /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14242
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v EnableVirtualization /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15722
reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\System" /v MaxSize /t REG_DWORD /d 32768 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26581
reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup" /v MaxSize /t REG_DWORD /d 32768 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26580
reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Security" /v MaxSize /t REG_DWORD /d 81920 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15697
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v AllowRspndrOndomain /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v AllowRspndrOnPublicNet /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v nableRspndr /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v ProhibitRspndrOnPrivateNet /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15696
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v AllowLLTDIOOndomain /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v AllowLLTDIOOnPublicNet /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v EnableLLTDIO /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD\" /v ProhibitLLTDIOOnPrivateNet /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-6832
reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\" /v RequireSecuritySignature /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-6833
reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters\" /v RequireSecuritySignature /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-6831
reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\" /v RequireSignOrSeal /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14262
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 0xffffffff /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14261
reg add "HKLM\Software\Policies\Microsoft\Windows\DriverSearching" /v DontSearchWindowsUpdate /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14260
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v DisableWebPnPDownload /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14269
reg add "HKEY_Current_User\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\" /v HideZoneInfoOnProperties /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1157
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\" /v SCRemoveOption /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3382
reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0\" /v NTLMMinClientSec /t REG_DWORD /d 0x20080000 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3376
reg add "HKLM\System\CurrentControlSet\Control\Lsa\" /v DisableDomainCreds /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-26578
reg add "HKLM\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\" /v "Teredo_State" /t REG_SZ /d Disabled /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3374
reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\" /v RequireStrongKey /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-36439
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy/t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3378
reg add "HKLM\System\CurrentControlSet\Control\Lsa\" /v ForceGuest /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1171
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateDASD /t REG_SZ /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15682
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds\" /v DisableEnclosureDownload /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15683
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\" /v PreXPSP2ShellProtocolBehavior /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1145
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\" /v AutoAdminLogon /t REG_SZ /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-1141
reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\" /v EnablePlainTextPassword /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15685
reg add "HKLM\Software\Policies\Microsoft\Windows\Installer\" /v EnableUserControl /t REG_DWORD /d 0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14270
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\" /v ScanWithAntiVirus /t REG_DWORD /d 3 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-3458
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\" /v MaxIdleTime /t REG_DWORD /d 0x000dbba0 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-14239
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\" /v EnableSecureUIAPaths /t REG_DWORD /d 1 /f

:: https://www.stigviewer.com/stig/windows_7/2014-04-02/
:: goto V-14239	 and start tehre downward


:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15722
reg add "HKLM\Software\Policies\Microsoft\WMDRM\" /v DisableOnline /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15722
reg add "HKLM\Software\Policies\Microsoft\WMDRM\" /v DisableOnline /t REG_DWORD /d 1 /f
:: ===== ::
:: https://www.stigviewer.com/stig/windows_7/2014-04-02/finding/V-15722
reg add "HKLM\Software\Policies\Microsoft\WMDRM\" /v DisableOnline /t REG_DWORD /d 1 /f
