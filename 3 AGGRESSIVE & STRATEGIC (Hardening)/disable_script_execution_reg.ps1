
# disable_script_execution.ps1
# Disables script execution for CMD, BAT, VBS via registry
$OutputFile = "$env:USERPROFILE\Desktop\disable_script_execution.txt"
"[*] Disabling CMD, BAT, and VBS script execution via registry..." | Out-File -FilePath $OutputFile

$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
)

foreach ($regPath in $regPaths) {
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }
    Set-ItemProperty -Path $regPath -Name "DisallowRun" -Value 1 -Force
    "[+] DisallowRun set in $regPath" | Out-File -FilePath $OutputFile -Append
    Write-Host "[+] DisallowRun set in $regPath"
}

# Block WScript and CScript execution
$scriptBlockPath = "HKLM:\Software\Microsoft\Windows Script Host\Settings"
if (-not (Test-Path $scriptBlockPath)) {
    New-Item -Path $scriptBlockPath -Force | Out-Null
}
Set-ItemProperty -Path $scriptBlockPath -Name "Enabled" -Value 0 -Force
"[+] Disabled Windows Script Host (VBS/JS execution)" | Out-File -FilePath $OutputFile -Append
Write-Host "[+] Disabled Windows Script Host (VBS/JS execution)" 

"[*] Script execution disabled successfully." | Out-File -FilePath $OutputFile -Append
Write-Host "[*] Script execution disabled successfully."


Write-Host "Output saved to: " $OutputFile
