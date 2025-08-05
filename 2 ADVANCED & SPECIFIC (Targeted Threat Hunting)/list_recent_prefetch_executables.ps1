$OutFile = "$env:USERPROFILE\Desktop\list_recent_prefetch_executables.txt"
$PrefetchFolder = "$env:SystemRoot\Prefetch"

if (Test-Path $PrefetchFolder) {
    Get-ChildItem -Path $PrefetchFolder -Filter *.pf | Sort-Object LastWriteTime -Descending | Select-Object -First 50 | ForEach-Object {
        Add-Content -Path $OutFile -Value "$($_.Name) - LastRun: $($_.LastWriteTime)"
    }
} else {
    Add-Content -Path $OutFile -Value "Prefetch folder not found or not accessible."
}



Write-Host "Output saved to: " $OutFile