# Configure Windows Firewall to Block All Outbound Except Whitelist

$path = "$env:USERPROFILE\Desktop\firewall_block_all_outbound.txt"
Set-NetFirewallProfile -All -DefaultOutboundAction Block
Set-NetFirewallProfile -All -DefaultInboundAction Allow
New-NetFirewallRule -DisplayName "Allow Outbound to 8.8.8.8" -Direction Outbound -Action Allow -RemoteAddress 8.8.8.8 -Profile Any
Get-NetFirewallProfile | Out-File -FilePath $path

Write-Host "Output saved to: " $path