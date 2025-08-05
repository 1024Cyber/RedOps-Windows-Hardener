$OutFile = "$env:USERPROFILE\Desktop\scan_run_runonce_registry.txt"
$regPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
)

foreach ($path in $regPaths) {
    try {
        Get-ItemProperty -Path $path | ForEach-Object {
            $_.PSObject.Properties | Where-Object { $_.Name -ne "PSPath" } | ForEach-Object {
                $entry = "$($_.Name) = $($_.Value)"
                if ($entry -match "AppData|Temp|\.vbs|\.bat|\.ps1|cmd\.exe|powershell\.exe") {
                    Add-Content -Path $OutFile -Value "[Suspicious] $path : $entry"
                } else {
                    Add-Content -Path $OutFile -Value "$path : $entry"
                }
            }
        }
    } catch {}
}



Write-Host "Output saved to: " $OutFile