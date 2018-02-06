if ($PSVersionTable.PSVersion.Major -gt 3)
{
    Write-Host "Powershell Version Sufficient To Run The Script"
}
else
{
    $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
}


# Still Need to add these extensions
# .webm .mkv .flv .vob .omv .ogg .drc .gif .gifv .mng .avi .mov .qt .wmv .yuh .rm .rmvb .asf .amv .mp4 .m4p .m4v .mpg .m4v .mpg .mp2 .mpeg .mpe .mpv .m2v .svi .3gp .3g2 .mxf .roq .nsv .flv .f4p .f4a .f4b .aif .iff .m3u .m4a .mid .mp3 .mpa .wav .wma .bmp .dds .jpg .png .psd .pspimage .tga .thm .tif .tiff .yuv .flac

get-childitem -Recurse C:\Users\ -include *.mp3,*.mp4,*.jpg,*.jpeg,*.png,*.gif,*.wav,*.wmv,*.mov -force | format-table LastWriteTime, Name, Directory >> "$PSScriptRoot\..\scanresult.txt"




