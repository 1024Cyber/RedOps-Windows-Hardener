$OutFile = "$env:USERPROFILE\Desktop\view_autostart_entries.txt"
Get-CimInstance -ClassName Win32_StartupCommand |
Select Name, Command, Location, User |
Out-File -FilePath $OutFile -Encoding UTF8