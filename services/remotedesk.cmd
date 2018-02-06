@echo off


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
reg delete "HKCU\SOFTWARE\Microsoft\Terminal Server Client" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f

netsh advfirewall firewall set rule group="remote desktop" new enable=No profile=domain
netsh advfirewall firewall set rule group="remote desktop" new enable=No profile=private
netsh advfirewall firewall set rule group="remote desktop" new enable=No

set rr=RemoteAccess RemoteRegistry RasMan RasAuto
for %%r in (%rr%) do (
	echo Service: %%r
	sc stop "%%r"
	sc config "%%r" start= disabled
	)
