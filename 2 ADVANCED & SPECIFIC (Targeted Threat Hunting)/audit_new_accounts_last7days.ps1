$OutFile = "$env:USERPROFILE\Desktop\audit_new_accounts_7days.txt"
$Since = (Get-Date).AddDays(-7)

Get-LocalUser | Where-Object {
    $_.Enabled -eq $true -and $_.WhenCreated -ge $Since
} | Select Name, Enabled, WhenCreated |
Out-File -FilePath $OutFile -Encoding UTF8

Write-Host "records saved to:" $OutFile
