
# enable_windows_firewall.ps1
# Enables Windows Firewall on all profiles
$OutputFile = "$env:USERPROFILE\Desktop\enable_windows_firewall.txt"
"[*] Enabling Windows Firewall for all profiles..." | Out-File -FilePath $OutputFile

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
"[+] Windows Firewall is now enabled for Domain, Public, and Private profiles." | Out-File -FilePath $OutputFile -Append


Write-Host "[+] Windows Firewall is now enabled for Domain, Public, and Private profiles."

Write-Host "Output saved to: " $OutputFile