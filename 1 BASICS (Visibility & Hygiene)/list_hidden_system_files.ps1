$OutFile = "$env:USERPROFILE\Desktop\list_hidden_system_files.txt"
Get-ChildItem -Path C:\ -Recurse -Force -ErrorAction SilentlyContinue |
Where-Object { $_.Attributes -match "Hidden|System" } |
Select FullName, Attributes, LastWriteTime, Length |
Out-File -FilePath $OutFile -Encoding UTF8

 Write-Host "Output saved to: " $OutFile