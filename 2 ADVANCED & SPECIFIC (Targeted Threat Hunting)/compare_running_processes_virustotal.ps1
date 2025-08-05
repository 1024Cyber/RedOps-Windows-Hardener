# compare_running_processes_virustotal.ps1

# Define output file path
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$OutFile = Join-Path $DesktopPath "compare_running_processes_virustotal.txt"

# Create list to store results
$results = @()

# Get running processes with file paths
$processes = Get-Process | Where-Object { $_.Path -ne $null } 2>$null

foreach ($proc in $processes) {
    try {
        $path = $proc.Path
        $name = $proc.ProcessName

        if (Test-Path $path) {
            # Get SHA256 hash
            $hash = Get-FileHash -Algorithm SHA256 -Path $path
            $results += "$name | $path | $($hash.Hash)"
        }
    } catch {
        # Skip inaccessible processes
        continue
    }
}

# Output to file
$results | Out-File -FilePath $OutFile -Encoding UTF8
Write-Output "Done. Output saved to $OutFile"
