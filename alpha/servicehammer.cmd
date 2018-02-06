@echo off
echo.
echo Service Hammer Activated
echo.

set services=RemoteAccess Telephony TapiSrv Tlntsvr tlntsvr p2pimsvc simptcp fax msftpsvc iprip ftpsvc RemoteRegistry RasMan RasAuto seclogon MSFTPSVC W3SVC SMTPSVC Dfs TrkWks MSDTC ERSVC NtFrs MSFtpsvc helpsvc IsmServ WmdmPmSN Spooler RDSessMgr RPCLocator RsoPProv ScardSvr Sacsvr TermService Uploadmgr VDS VSS WINS WinHttpAutoProxySvc SZCSVC CscService hidserv IPBusEnum PolicyAgent SCPolicySvc SharedAccess SSDPSRV Themes upnphost nfssvc nfsclnt
for %%z in (%services%) do (
	echo Service: %%z
	sc stop "%%z"
	sc config "%%z" start= disabled
)

echo.
