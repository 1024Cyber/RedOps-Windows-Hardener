# Block Access to CMD/PowerShell for Non-Admin Users

$path = "$env:USERPROFILE\Desktop\block_cmd_powershell.txt"
New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\System" -Name "DisableCMD" -PropertyType DWord -Value 1 -Force | Out-Null
New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\System" -Name "EnableScripts" -PropertyType DWord -Value 0 -Force | Out-Null
"CMD and PowerShell blocked for non-admin users" | Out-File -FilePath $path

Write-Host "Output saved to: " $path