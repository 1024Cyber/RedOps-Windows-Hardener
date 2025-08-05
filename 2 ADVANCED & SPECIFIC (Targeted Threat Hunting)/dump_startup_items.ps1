$startupItems = Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Command, Location, User
$desktop = [Environment]::GetFolderPath("Desktop")
$startupItems | Out-File "$desktop\dump_startup_items.txt"

Write-Host "Output saved to: $desktop\dump_startup_items.txt"