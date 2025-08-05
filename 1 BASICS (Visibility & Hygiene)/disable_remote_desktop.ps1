$OutFile = "$env:USERPROFILE\Desktop\disable_remote_desktop.txt"
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
"Remote Desktop disabled." | Out-File -FilePath $OutFile

Write-Host "Output saved to: " $OutFile