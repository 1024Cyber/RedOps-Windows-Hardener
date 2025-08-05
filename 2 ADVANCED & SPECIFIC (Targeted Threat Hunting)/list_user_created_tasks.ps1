$OutFile = "$env:USERPROFILE\Desktop\list_user_created_tasks.txt"
$Tasks = Get-ScheduledTask | Where-Object {
    $_.TaskPath -notlike "\Microsoft\*" -and $_.TaskName -ne ""
}
$Tasks | ForEach-Object {
    [PSCustomObject]@{
        TaskName = $_.TaskName
        Path     = $_.TaskPath
        Author   = ($_ | Get-ScheduledTaskInfo).LastRunTime
        User     = $_.Principal.UserId
    }
} | Out-File -FilePath $OutFile -Encoding UTF8



Write-Host "Output saved to: " $OutFile
