$OutFile = "$env:USERPROFILE\Desktop\disable_autorun.txt"
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f |
Out-File -FilePath $OutFile -Encoding UTF8

Write-Host "Output saved to: " $OutFile