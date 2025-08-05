# Enable Full Command-Line Process Auditing via Sysmon or AuditPol


$path = "$env:USERPROFILE\Desktop\enable_cmdline_auditing.txt"
auditpol /set /subcategory:"Process Creation" /success:enable
"Full command-line auditing enabled" | Out-File -FilePath $path

Write-Host "Full command-line auditing enabled"

Write-Host "Output saved to: " $path