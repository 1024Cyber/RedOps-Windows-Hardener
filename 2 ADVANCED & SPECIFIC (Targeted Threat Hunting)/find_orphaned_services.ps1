$Output = "$env:USERPROFILE\Desktop\identify_orphaned_services.txt"
Get-WmiObject Win32_Service | Where-Object {
    $_.State -eq "Running" -and -not (Test-Path $_.PathName -ErrorAction SilentlyContinue)
} | Select-Object Name, DisplayName, PathName, StartMode |
Out-File -FilePath $Output -Encoding UTF8


Write-Host "Output saved to: " $Output
