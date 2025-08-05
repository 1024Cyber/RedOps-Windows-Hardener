# Disable Windows Installer for Standard Users

$path = "$env:USERPROFILE\Desktop\disable_windows_installer.txt"
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "DisableMSI" -PropertyType DWord -Value 1 -Force
"Windows Installer disabled for standard users" | Out-File -FilePath $path

Write-Host "Windows Installer disabled for standard users"

Write-Host "Output saved to: " $path