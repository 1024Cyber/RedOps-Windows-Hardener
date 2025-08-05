# Audit and Harden Local Security Policy via secedit templates

$path = "$env:USERPROFILE\Desktop\audit_harden_secedit.txt"
$inf = "$env:USERPROFILE\Desktop\baseline.inf"
$log = "$env:USERPROFILE\Desktop\secedit_log.txt"

@"
[Unicode]
Unicode=yes
[System Access]
MinimumPasswordAge = 1
MaximumPasswordAge = 60
MinimumPasswordLength = 12
PasswordComplexity = 1
LockoutBadCount = 5
ResetLockoutCount = 15
LockoutDuration = 15
[Version]
signature="$CHICAGO$"
Revision=1
"@ | Out-File -Encoding ASCII -FilePath $inf

secedit /configure /db secedit.sdb /cfg $inf /log $log
Get-Content $log | Out-File -FilePath $path

Write-Host "Output saved to: " $path
