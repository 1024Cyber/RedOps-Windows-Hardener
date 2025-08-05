# Restrict RDP to Specific Local Admins Only

$path = "$env:USERPROFILE\Desktop\restrict_rdp_admins.txt"
$group = "Remote Desktop Users"
net localgroup "$group" "Administrator" /add
Get-LocalGroupMember -Group "$group" | Out-File -FilePath $path


Write-Host "  RDP Restricted to Specific Local Admins Only "

Write-Host "Output saved to: " $path