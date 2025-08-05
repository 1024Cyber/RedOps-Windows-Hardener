$Output = "$env:USERPROFILE\Desktop\check_unsigned_running_processes.txt"
Get-Process | ForEach-Object {
    $path = $_.Path
    if ($path -and (Test-Path $path)) {
        $signature = Get-AuthenticodeSignature $path
        if ($signature.Status -ne 'Valid') {
            [PSCustomObject]@{
                ProcessName = $_.Name
                Path = $path
                SignatureStatus = $signature.Status
            }
        }
    }
} | Out-File -FilePath $Output -Encoding UTF8


Write-Host "Output saved to:" $Output