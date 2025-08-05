# Disable Script Execution via Group Policy (CMD, BAT, VBS)

$path = "$env:USERPROFILE\Desktop\disable_script_execution.txt"
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine -Force
"Script execution disabled via group policy" | Out-File -FilePath $path

Write-Host "Script execution disabled via group policy" 

Write-Host "Output saved to: " $path