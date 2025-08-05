# Enable Logging for PowerShell Module/Script Block Events

$path = "$env:USERPROFILE\Desktop\enable_ps_logging.txt"
New-Item -Path HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Force
Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -Value 1
"PowerShell logging enabled" | Out-File -FilePath $path

Write-Host "PowerShell logging enabled"

Write-Host "Output saved to: " $path