$OutFile = "$env:USERPROFILE\Desktop\disable_windows_script_host.txt"
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value 0 -PropertyType DWord -Force |
Out-File -FilePath $OutFile -Encoding UTF8


Write-Host "Output saved to: " $OutFile