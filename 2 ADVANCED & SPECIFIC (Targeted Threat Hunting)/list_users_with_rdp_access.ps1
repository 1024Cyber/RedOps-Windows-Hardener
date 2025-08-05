$users = (Get-LocalGroupMember -Group "Remote Desktop Users" | Select-Object -ExpandProperty Name)
$desktop = [Environment]::GetFolderPath("Desktop")
$users | Out-File "$desktop\list_users_with_rdp_access.txt"



Write-Host "Output saved to: $desktop\list_users_with_rdp_access.txt"