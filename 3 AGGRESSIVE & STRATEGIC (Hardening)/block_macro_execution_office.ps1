# Block Macro Execution in Office via Registry
# block_office_macros.ps1
# Blocks all Office macros including those from trusted locations via registry
$OutputFile = "$env:USERPROFILE\Desktop\block_office_macros.txt"
"[*] Blocking macro execution in Office applications..." | Out-File -FilePath $OutputFile

$officeVersions = @("16.0", "15.0", "14.0")  # Office 2016, 2013, 2010
foreach ($ver in $officeVersions) {
    $paths = @(
        "HKCU:\Software\Microsoft\Office\$ver\Word\Security",
        "HKCU:\Software\Microsoft\Office\$ver\Excel\Security",
        "HKCU:\Software\Microsoft\Office\$ver\PowerPoint\Security"
    )
    foreach ($path in $paths) {
        if (-not (Test-Path $path)) {
            New-Item -Path $path -Force | Out-Null
        }
        Set-ItemProperty -Path $path -Name "VbaWarnings" -Value 4 -Force
        "[+] Set macro block in $path" | Out-File -FilePath $OutputFile -Append
    }
}
"[*] Macro execution blocked for Word, Excel, PowerPoint." | Out-File -FilePath $OutputFile -Append


Write-Host  "[*] Macro execution blocked for Word, Excel, PowerPoint." 
Write-Host "Output saved to: " $OutputFile

