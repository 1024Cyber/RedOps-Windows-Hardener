$OutFile = "$env:USERPROFILE\Desktop\reenable_windows_defender.txt"
Set-MpPreference -DisableRealtimeMonitoring $false
"Windows Defender Real-Time Protection re-enabled." | Out-File -FilePath $OutFile