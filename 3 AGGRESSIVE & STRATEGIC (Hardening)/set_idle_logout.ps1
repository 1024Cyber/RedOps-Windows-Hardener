# Set Automatic Logout on Idle Sessions

$path = "$env:USERPROFILE\Desktop\auto_logout_idle.txt"
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value "900" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value "1" -PropertyType String -Force
"Idle logout set to 15 minutes" | Out-File -FilePath $path


Write-Host "Idle logout set to 15 minutes"

Write-Host "Output saved to: " $path