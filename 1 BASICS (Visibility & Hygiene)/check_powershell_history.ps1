$OutFile = "$env:USERPROFILE\Desktop\check_powershell_history.txt"
$histPath = "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
if (Test-Path $histPath) {
    Get-Content $histPath | Select-String -Pattern "invoke|download|http|iex|net.webclient|shell" |
    Out-File -FilePath $OutFile -Encoding UTF8
} else {
    "PowerShell history file not found." | Out-File -FilePath $OutFile
}


Write-Host "Output saved to: " $OutFile