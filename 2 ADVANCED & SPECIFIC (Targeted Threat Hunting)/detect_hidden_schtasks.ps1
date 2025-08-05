$tasks = schtasks /query /fo LIST /v 2>&1 | Select-String "TaskName|Task To Run|Status"
$desktop = [Environment]::GetFolderPath("Desktop")
$tasks | Out-File "$desktop\detect_hidden_schtasks.txt"

Write-Host "Output saved to: " $desktop 