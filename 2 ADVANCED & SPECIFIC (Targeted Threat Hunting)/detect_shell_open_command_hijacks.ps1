$OutFile = "$env:USERPROFILE\Desktop\detect_shell_open_command_hijacks.txt"
$fileTypes = @("exe", "bat", "cmd", "ps1")

foreach ($ext in $fileTypes) {
    $keyPath = "HKCR:\$ext\shell\open\command"
    try {
        $cmd = (Get-ItemProperty -Path $keyPath -ErrorAction Stop)."(default)"
        Add-Content -Path $OutFile -Value "$ext open command: $cmd"

        if ($cmd -notmatch "$env:SystemRoot\\System32\\") {
            Add-Content -Path $OutFile -Value "[Potential Hijack Detected for .$ext]"
        }
    } catch {
        Add-Content -Path $OutFile -Value "Could not read $keyPath"
    }
}


Write-Host "Output saved to: " $OutFile