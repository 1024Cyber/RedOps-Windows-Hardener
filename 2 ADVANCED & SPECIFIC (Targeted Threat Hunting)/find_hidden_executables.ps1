$paths = @(
    "$env:APPDATA",
    "$env:ProgramData",
    "$env:USERPROFILE"
)

$results = foreach ($path in $paths) {
    Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue |
    Where-Object {
        $_.Extension -eq ".exe" -and $_.Attributes -match "Hidden"
    } | Select-Object FullName, Length, LastWriteTime
}

$desktop = [Environment]::GetFolderPath("Desktop")
$results | Out-File "$desktop\find_hidden_executables.txt"

Write-Host "Output saved to:  desktop\find_hidden_executables.txt" 

