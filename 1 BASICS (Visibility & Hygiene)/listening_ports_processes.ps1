$OutFile = "$env:USERPROFILE\Desktop\listening_ports_processes.txt"
$results = Get-NetTCPConnection -State Listen | ForEach-Object {
    $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        Port    = $_.LocalPort
        Process = $proc.ProcessName
        PID     = $_.OwningProcess
        Path    = $proc.Path
    }
}
$results | Out-File -FilePath $OutFile -Encoding UTF8