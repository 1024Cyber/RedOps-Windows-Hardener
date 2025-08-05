$OutFile = "$env:USERPROFILE\Desktop\block_powershell_v2.txt"
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart |
Out-File -FilePath $OutFile -Encoding UTF8

Write-Host "Output saved to: " $OutFile