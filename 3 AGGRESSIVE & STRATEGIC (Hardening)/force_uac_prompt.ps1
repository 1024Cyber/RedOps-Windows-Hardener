# Force User Account Control (UAC) to Always Prompt for Admin Consent


$path = "$env:USERPROFILE\Desktop\force_uac_prompt.txt"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2
"UAC set to always prompt" | Out-File -FilePath $path

Write-Host "UAC set to always prompt"

Write-Host "Output saved to: " $path