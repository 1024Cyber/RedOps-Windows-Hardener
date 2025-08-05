$OutFile = "$env:USERPROFILE\Desktop\find_weak_file_permissions.txt"
Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue |
Where-Object {
    (Get-Acl $_.FullName).Access | Where-Object {
        $_.IdentityReference -match "Everyone" -and $_.FileSystemRights -match "FullControl"
    }
} | Select FullName | Out-File -FilePath $OutFile -Encoding UTF8


Write-Host "Output saved to: " $OutFile