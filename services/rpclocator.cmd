@echo off
echo.
net stop RpcLocator
net stop RpcSs
net stop RpcEptMapper

sc stop RpcLocator
sc stop RpcSs
sc stop RpcEptMapper

	sc delete RpcLocator
	sc config "RpcLocator" start= disabled

	sc delete RpcSs
	sc config "RpcSs" start= disabled

	sc delet RpcEptMapper
	sc config "RpcEptMapper" start= disabled

REG add "HKLM\SYSTEM\CurrentControlSet\services\RpcLocator" /v Start /t REG_DWORD /d 4 /f
REG add "HKLM\SYSTEM\CurrentControlSet\services\RpcSs" /v Start /t REG_DWORD /d 4 /f
REG add "HKLM\SYSTEM\CurrentControlSet\services\RpcEptMapper" /v Start /t REG_DWORD /d 4 /f

echo.
