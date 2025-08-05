$OutFile = "$env:USERPROFILE\Desktop\check_wmi_persistence.txt"
Get-WmiObject -Namespace "root\subscription" -Class __EventFilter |
Select Name, Query, CreatorSID | Out-File -FilePath $OutFile -Encoding UTF8

Add-Content $OutFile "`n----- Consumers -----`n"
Get-WmiObject -Namespace "root\subscription" -Class CommandLineEventConsumer |
Select Name, CommandLineTemplate | Out-File -Append -Encoding UTF8 -FilePath $OutFile

Add-Content $OutFile "`n----- Bindings -----`n"
Get-WmiObject -Namespace "root\subscription" -Class __FilterToConsumerBinding |
Select Filter, Consumer | Out-File -Append -Encoding UTF8 -FilePath $OutFile

Write-Host "Output saved to: " $OutFile 
