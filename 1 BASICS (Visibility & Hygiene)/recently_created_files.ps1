$OutFile = "$env:USERPROFILE\Desktop\recently_created_files.txt"
Get-ChildItem -Path C:\ -Recurse -Force -ErrorAction SilentlyContinue |
Where-Object { $_.CreationTime -gt (Get-Date).AddDays(-7) } |
Select FullName, CreationTime, Length |
Sort CreationTime -Descending |
Out-File -FilePath $OutFile -Encoding UTF8