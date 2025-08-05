$OutFile = "$env:USERPROFILE\Desktop\hidden_executables_appdata_programdata_user.txt"
$targets = @("C:\ProgramData", "$env:APPDATA", "$env:LOCALAPPDATA")
$targets += Get-ChildItem "C:\Users" -Directory -ErrorAction SilentlyContinue | ForEach-Object { "$($_.FullName)\AppData" }

$results = foreach ($dir in $targets) {
    if (Test-Path $dir) {
        Get-ChildItem -Path $dir -Recurse -Include *.exe -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Attributes -match "Hidden" } |
        Select FullName, Attributes, LastWriteTime, Length
    }
}
$results | Out-File -FilePath $OutFile -Encoding UTF8

Write-Host "Output saved to: " $OutFile