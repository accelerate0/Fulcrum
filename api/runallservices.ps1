if ($PSVersionTable.PSVersion.Major -gt 3)
{
    Write-Host "Running All Services"
}
else
{
    $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
        Write-Host "Running All Services"
}


Get-Childitem -Path "$PSScriptRoot\..\service" -Filter *.cmd | % {& $_.FullName}
Get-Childitem -Path "$PSScriptRoot\..\services" -Filter *.ps1 | % {& $_.FullName}
