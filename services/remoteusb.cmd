@echo off

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WirelessUSBManager" /f
