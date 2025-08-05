$OutFile = "$env:USERPROFILE\Desktop\check_active_rdp_sessions.txt"
quser | Out-File -FilePath $OutFile -Encoding UTF8


Write-Host "Output saved to: " $OutFile