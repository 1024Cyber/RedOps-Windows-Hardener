
# disable_guest_account.ps1
# Disables the built-in Guest account
$OutputFile = "$env:USERPROFILE\Desktop\disable_guest_account.txt"
"[*] Disabling built-in Guest account..." | Out-File -FilePath $OutputFile

try {
    Disable-LocalUser -Name "Guest" -ErrorAction Stop
    "[+] Guest account disabled." | Out-File -FilePath $OutputFile -Append
    Write-Host "[+] Guest account disabled."
} catch {
    "[-] Failed to disable Guest account or it may already be disabled." | Out-File -FilePath $OutputFile -Append
    Write-Host "[-] Failed to disable Guest account or it may already be disabled."
}

Write-Host "Output saved to: " $OutputFile
