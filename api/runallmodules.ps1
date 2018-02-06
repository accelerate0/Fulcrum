if ($PSVersionTable.PSVersion.Major -gt 3)
{
    Write-Host "Running All Modules"
}
else
{
    $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
        Write-Host "Running All Modules"
}


Get-Childitem -Path "$PSScriptRoot\..\modules" -Filter *.cmd | % {& $_.FullName}
Get-Childitem -Path "$PSScriptRoot\..\modules" -Filter *.ps1 | % {& $_.FullName}
