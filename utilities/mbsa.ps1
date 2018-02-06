# Check PowerShell Version For Path Environment Variable
if ($PSVersionTable.PSVersion.Major -gt 3)
{
    Write-Host "Powershell Version Sufficient To Run The Script"
}
else
{
    $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
}

# Path for the workdir
$installpath = "$PSScriptRoot\utilities\mbsa"

# Check if work directory exists if not create it

If (Test-Path -Path $installpath -PathType Container)
{ Write-Host "$installpath already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $installpath  -ItemType directory }

# Download the installer

$link = "http://go.microsoft.com/fwlink/?LinkId=182512"
$destination = "$installpath\mbsa-setup.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $link -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($link, $destination)
}

# Start the installation

Start-Process -FilePath "$installpath\mbsa-setup.exe" -ArgumentList "/S"
