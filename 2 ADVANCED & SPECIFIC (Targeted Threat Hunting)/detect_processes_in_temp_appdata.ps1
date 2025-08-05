$folders = @(
    "$env:APPDATA",
    "$env:TEMP",
    "$env:USERPROFILE"
)

$results = Get-Process | Where-Object {
    foreach ($folder in $folders) {
        $_.Path -like "$folder*"
    }
} | Select-Object Name, Id, Path

$desktop = [Environment]::GetFolderPath("Desktop")
$results | Out-File "$desktop\detect_processes_in_temp_appdata.txt"


Write-Host "Output saved to: $desktop\detect_processes_in_temp_appdata.txt" 