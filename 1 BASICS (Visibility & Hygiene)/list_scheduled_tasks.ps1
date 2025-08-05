$OutFile = "$env:USERPROFILE\Desktop\list_scheduled_tasks.txt"
Get-ScheduledTask |
Where-Object { $_.TaskPath -notlike "\Microsoft*" } |
Select TaskName, TaskPath, State |
Out-File -FilePath $OutFile -Encoding UTF8