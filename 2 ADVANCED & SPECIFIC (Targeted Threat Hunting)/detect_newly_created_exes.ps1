# detect_newly_created_exes.ps1
$OutFile = "$env:USERPROFILE\Desktop\detect_newly_created_exes.txt"

# Common user-writable locations
$ScanPaths = @(
    "$env:USERPROFILE\AppData",
    "$env:ProgramData",
    "$env:USERPROFILE"
)

$CutoffDate = (Get-Date).AddDays(-7)

$Results = @()

foreach ($path in $ScanPaths) {
    try {
        $Results += Get-ChildItem -Path $path -Recurse -Include *.exe -File -ErrorAction SilentlyContinue |
            Where-Object { $_.CreationTime -ge $CutoffDate } |
            Select-Object FullName, CreationTime
    } catch {
        Write-Output "Access denied to: $path"
    }
}

$Results | Sort-Object CreationTime -Descending | Format-Table -AutoSize | Out-File -FilePath $OutFile -Encoding UTF8


Write-Host "Output saved to: " $OutFile