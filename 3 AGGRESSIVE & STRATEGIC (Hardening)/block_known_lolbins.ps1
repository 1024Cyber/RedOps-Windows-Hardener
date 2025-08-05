# Block Known LOLBins (Living off the Land Binaries) via Hash or Path Rules

$path = "$env:USERPROFILE\Desktop\block_lolbins.txt"
$lolbins = @("C:\Windows\System32\mshta.exe", "C:\Windows\System32\regsvr32.exe")
foreach ($exe in $lolbins) {
    if (Test-Path $exe) {
        icacls $exe /deny "Users:(X)" | Out-File -Append -FilePath $path
    }
}


Write-Host "Output saved to: " $path
