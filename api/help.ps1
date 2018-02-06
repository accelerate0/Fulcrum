$newline = "`r`n"

#Check PowerShell Version
if ($PSVersionTable.PSVersion.Major -gt 3)
{
    Write-Host $newline
}
else
{
    $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
}




$HelpModules = "$PSScriptRoot\..\modules\"
$HelpServices = "$PSScriptRoot\..\services\"
$HelpAPI = "$PSScriptRoot\..\api\"
$HelpUtilities = "$PSScriptRoot\..\utilities\"
$HelpAlpha = "$PSScriptRoot\..\alpha\"




#


Write-Host $newline
Write-Host "=Modules="
Get-ChildItem ($HelpModules) | Foreach-Object {$_.BaseName}

Write-Host $newline
Write-Host "=Misc="
Write-Host "shell"
Write-Host "stigs"
Write-Host "exit"

Write-Host $newline
Write-Host "=API="
Get-ChildItem ($HelpAPI) | Foreach-Object {$_.BaseName}

Write-Host $newline
Write-Host "=Services="
Get-ChildItem ($HelpServices) | Foreach-Object {$_.BaseName}

Write-Host $newline
Write-Host "=Utilities="
Get-ChildItem ($HelpUtilities) | Foreach-Object {$_.BaseName}

Write-Host $newline
Write-Host "=Alpha="
Get-ChildItem ($HelpAlpha)| Foreach-Object {$_.BaseName}
Write-Host $newline
