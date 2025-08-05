# Whitelist Only Specific USB Devices Using Device Installation Restrictions


$path = "$env:USERPROFILE\Desktop\restrict_usb_devices.txt"
$key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions"
New-Item -Path $key -Force
Set-ItemProperty -Path $key -Name "DenyUnspecified" -Value 1 -Type DWord
"Only allowed USB devices can be installed" | Out-File -FilePath $path

Write-Host "Only allowed USB devices can be installed"

Write-Host "Output saved to: " $path
