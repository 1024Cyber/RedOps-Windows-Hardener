$OutFile = "$env:USERPROFILE\Desktop\scan_alternate_data_streams.txt"
$Dirs = @("$env:USERPROFILE", "$env:APPDATA", "$env:LOCALAPPDATA", "C:\ProgramData")

foreach ($dir in $Dirs) {
    Get-ChildItem -Path $dir -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.FullName -match '\.exe$'
    } | ForEach-Object {
        try {
            $streams = Get-Item -Path $_.FullName -Stream * -ErrorAction SilentlyContinue
            if ($streams.Count -gt 1) {
                Add-Content $OutFile "`n--- ADS Detected in: $($_.FullName) ---"
                $streams | Out-String | Out-File -Append -Encoding UTF8 -FilePath $OutFile
            }
        } catch {}
    }
}



Write-Host "Output saved to: " $OutFile