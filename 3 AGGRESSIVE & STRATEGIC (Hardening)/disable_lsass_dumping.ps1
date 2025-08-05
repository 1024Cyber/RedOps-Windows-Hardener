# Disable LSASS Dumping via Registry

$path = "$env:USERPROFILE\Desktop\disable_lsass_dumping.txt"
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -Name "UseLogonCredential" -PropertyType DWord -Value 0 -Force
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL" -PropertyType DWord -Value 1 -Force
"LSASS dumping disabled" | Out-File -FilePath $path

Write-Host "LSASS dumping disabled"

Write-Host "Output saved to: " $path