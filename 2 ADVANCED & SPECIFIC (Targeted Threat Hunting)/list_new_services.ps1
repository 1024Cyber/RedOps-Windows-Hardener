$days = 7
$cutoff = (Get-Date).AddDays(-$days)
$services = Get-WmiObject Win32_Service |
    Where-Object { $_.InstallDate -ne $null -and [Management.ManagementDateTimeConverter]::ToDateTime($_.InstallDate) -ge $cutoff }

$desktop = [Environment]::GetFolderPath("Desktop")
$services | Select-Object Name, DisplayName, PathName, StartMode, State |
Out-File "$desktop\list_new_services.txt"



Write-Host "Output saved to:  $desktop\list_new_services.txt"