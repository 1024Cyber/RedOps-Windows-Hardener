$Output = "$env:USERPROFILE\Desktop\dump_active_network_connections.txt"
netstat -ano | Select-String "ESTABLISHED|LISTENING" |
ForEach-Object {
    $fields = ($_ -split "\s+") | Where-Object { $_ -ne "" }
    if ($fields.Count -ge 5) {
        [PSCustomObject]@{
            Proto = $fields[0]
            LocalAddress = $fields[1]
            RemoteAddress = $fields[2]
            State = $fields[3]
            PID = $fields[4]
        }
    }
} | Out-File -FilePath $Output -Encoding UTF8

Write-Host "Output saved to: " $Output
