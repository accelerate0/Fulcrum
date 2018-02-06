$version = [System.Environment]::OSVersion.Major 

If ($version -ge 10) {

  $newline = "`r`n"

  Write-Host $newline
  Write-Host $newline

  Write-Host "All Features"
  get-windowsoptionalfeature -online | ft | more
  # https://www.raymond.cc/blog/add-or-remove-windows-features-through-the-command-prompt/
  Write-Host $newline

  Write-Host "Installed Features That Are Enabled"
  get-windowsoptionalfeature -online | where state -like enabled* | ft | more
  Write-Host $newline

  Write-Host "Installed Features That Are Disabled"
  get-windowsoptionalfeature -online | where state -like disabled* | ft | more
  Write-Host $newline
  Write-Host $newline

  }  Else {

    Write-Host "This Module Requires Windows 10"

}
