$OutFile = "$env:USERPROFILE\Desktop\find_base64_obfuscated_scripts.txt"
$UserDirs = @("$env:USERPROFILE", "$env:APPDATA", "$env:LOCALAPPDATA")

foreach ($dir in $UserDirs) {
    Get-ChildItem -Path $dir -Recurse -Include *.ps1,*.txt -ErrorAction SilentlyContinue -Force | ForEach-Object {
        try {
            $content = Get-Content $_.FullName -Raw -ErrorAction Stop
            if ($content -match '([A-Za-z0-9+/]{80,}=*)') {
                Add-Content $OutFile "`n---- Possible Obfuscation in $($_.FullName) ----"
                Add-Content $OutFile $content
            }
        } catch {}
    }
}


Write-Host "Output saved to: " $OutFile
