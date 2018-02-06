do {


    $e = Read-Host ($env:username + "@Indica")
    $x = 1 # Scrap variable


    if (!$e) { $x -eq $x | out-null } #This is just here as a "Do Nothing" Function, aka make an extra line
    else {



      ForEach ($command in $e) {


#        Progress Bar
#        $counter = 0
#        $counter++
#        Write-Progress -Activity 'Patch Work Progress' -CurrentOperation $command -PercentComplete (($counter / $e.count) * 100)
#        Start-Sleep -Milliseconds 200


# Check Modules
if (  (Test-Path ($PSScriptRoot + "\modules\" + $command + ".cmd")) -or (Test-Path ($PSScriptRoot + "\modules\" + $command + ".ps1")))
      {
        if (Test-Path ($PSScriptRoot + "\modules\" + $command + ".cmd"))
            { & "$PSScriptRoot\modules\$command.cmd"  }
        if (Test-Path ($PSScriptRoot + "\modules\" + $command + ".ps1"))
            {  $ps1modules= $PSScriptRoot + "\modules\" + $command + ".ps1"
                &$ps1modules }

              }


# Check Services

elseif (  (Test-Path ($PSScriptRoot + "\services\" + $command + ".cmd")) -or (Test-Path ($PSScriptRoot + "\services\" + $command + ".ps1")))
        {
          if (Test-Path ($PSScriptRoot + "\services\" + $command + ".cmd"))
              { & "$PSScriptRoot\services\$command.cmd"  }
          if (Test-Path ($PSScriptRoot + "\services\" + $command + ".ps1"))
              { $ps1alpha= $PSScriptRoot + "\services\" + $command + ".ps1"
                 &$ps1alpha }

            }
# Check Alpha

elseif (  (Test-Path ($PSScriptRoot + "\alpha\" + $command + ".cmd")) -or (Test-Path ($PSScriptRoot + "\alpha\" + $command + ".ps1")))
       {
        if (Test-Path ($PSScriptRoot + "\alpha\" + $command + ".cmd"))
            { & "$PSScriptRoot\alpha\$command.cmd"  }
        if (Test-Path ($PSScriptRoot + "\alpha\" + $command + ".ps1"))
            { $ps1alpha= $PSScriptRoot + "\alpha\" + $command + ".ps1"
               &$ps1alpha }

             }

# Check Utilities

elseif (  (Test-Path ($PSScriptRoot + "\utilities\" + $command + ".cmd")) -or (Test-Path ($PSScriptRoot + "\utilities\" + $command + ".ps1")))
       {
        if (Test-Path ($PSScriptRoot + "\utilities\" + $command + ".cmd"))
            {  & "$PSScriptRoot\utilities\$command.cmd" }
        if (Test-Path ($PSScriptRoot + "\utilities\" + $command + ".ps1"))
            {  $ps1scanners= $PSScriptRoot + "\utilities\" + $command + ".ps1"
               &$ps1scanners }

             }
# Check API

elseif (  (Test-Path ($PSScriptRoot + "\api\" + $command + ".cmd")) -or (Test-Path ($PSScriptRoot + "\api\" + $command + ".ps1")))
       {
        if (Test-Path ($PSScriptRoot + "\api\" + $command + ".cmd"))
            {  & "$PSScriptRoot\api\$command.cmd" }
        if (Test-Path ($PSScriptRoot + "\api\" + $command + ".ps1"))
            {  $ps1api= $PSScriptRoot + "\api\" + $command + ".ps1"
               &$ps1api }



# If None Exists
   } Else  {

      if ($command -eq "stigs") {
                $stigs = $PSScriptRoot + "\" + $command + ".cmd"
                &$stigs
                break
              }

      else   {
        Write-Host "Unknown Command [$command] "
      }



          }

        }

      }

} while ($command -eq $command) # Pointless just there ot keep the loop going
