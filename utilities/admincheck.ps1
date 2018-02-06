function Test-AdminChecker {

([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

}

if (!(Test-AdminChecker)){
  throw "Administrative Privilages Not Detected"
  }
else {
  Write-Host "You Are Running With Administrative Priviliges"
}
