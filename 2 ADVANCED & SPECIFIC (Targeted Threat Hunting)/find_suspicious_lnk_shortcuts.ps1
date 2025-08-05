$OutFile = "$env:USERPROFILE\Desktop\find_suspicious_lnk_shortcuts.txt"
$dirsToScan = @("$env:USERPROFILE\Desktop", "$env:APPDATA\Microsoft\Windows\Start Menu", "$env:APPDATA")

foreach ($dir in $dirsToScan) {
    Get-ChildItem -Path $dir -Recurse -Filter *.lnk -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            $shell = New-Object -ComObject WScript.Shell
            $shortcut = $shell.CreateShortcut($_.FullName)
            $targetPath = $shortcut.TargetPath

            if ($targetPath -match "AppData|Temp|\.bat|\.ps1|cmd\.exe|powershell\.exe") {
                Add-Content -Path $OutFile -Value "Suspicious shortcut: $($_.FullName) -> $targetPath"
            }
        } catch {}
    }
}



Write-Host "Output saved to: " $OutFile