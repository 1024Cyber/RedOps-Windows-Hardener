$paths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
)

$results = foreach ($path in $paths) {
    if (Test-Path $path) {
        Get-ItemProperty -Path $path | Select-Object * -ExcludeProperty PS* | Format-List
    }
}

$desktop = [Environment]::GetFolderPath("Desktop")
$results | Out-File "$desktop\check_persistence_regkeys.txt"
Write-Host "records saved to: $desktop\check_persistence_regkeys.txt"
