$OutFile = "$env:USERPROFILE\Desktop\find_unknown_admins.txt"
$Admins = Get-LocalGroupMember -Group "Administrators"
$DefaultAccounts = @("Administrator", "DefaultAccount", "WDAGUtilityAccount", "Admin")
$Admins | Where-Object { $DefaultAccounts -notcontains $_.Name } |
Select Name, ObjectClass | Out-File -FilePath $OutFile -Encoding UTF8


Write-Host "Output saved to: " $OutFile