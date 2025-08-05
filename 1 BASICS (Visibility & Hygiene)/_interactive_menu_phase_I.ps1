
function Show-Menu {
    Clear-Host
    Write-Host "          "
    Write-Host "  ====================== Threat Hunting & Hardening Toolkit PHASE-I ( Basics ) ===========================" 
    Write-Host "     Developed for: Rapid Threat Detection & Windows Hardening By:  1024-Cybersecurity Services" 
    Write-Host "                  Twitter:   x.com/1024Cyber   " 
    Write-Host "                  LinkedIn:  linkedin.com/in/1024Cyber   "  
    Write-Host "                  Github:    github.com/1024Cyber                 "
    Write-Host "  =================================================================================================="
    Write-Host "          "
    Write-Host "1.  List Hidden/System Files"
    Write-Host "2.  Recently Created Files"
    Write-Host "3.  Hidden Executables in AppData/ProgramData/User"
    Write-Host "4.  View Auto-Start Entries"
    Write-Host "5.  List Scheduled Tasks"
    Write-Host "6.  Listening Ports and Processes"
    Write-Host "7.  Check PowerShell History"
    Write-Host "8.  Check Active RDP Sessions"
    Write-Host "9.  Disable Autorun"
    Write-Host "10. Disable Windows Script Host"
    Write-Host "11. Disable Remote Desktop"
    Write-Host "12. Re-enable Windows Defender"
    Write-Host "13. Block PowerShell v2"
    Write-Host "14. Find Weak File Permissions"

    Write-Host "0.  Exit"
    Write-Host "          "
}

function Run-Command {
    param([string]$choice)
    $scriptMap = @{
        '1' = 'list_hidden_system_files.ps1'
        '2' = 'recently_created_files.ps1'
        '3' = 'hidden_executables_appdata_programdata_user.ps1'
        '4' = 'view_autostart_entries.ps1'
        '5' = 'list_scheduled_tasks.ps1'
        '6' = 'listening_ports_processes.ps1'
        '7' = 'check_powershell_history.ps1'
        '8' = 'check_active_rdp_sessions.ps1'
        '9' = 'disable_autorun.ps1'
        '10' = 'disable_windows_script_host.ps1'
        '11' = 'disable_remote_desktop.ps1'
        '12' = 're-enable_windows_defender.ps1'
        '13' = 'block_powershell_v2.ps1'
        '14' = 'find_weak_file_permissions.ps1'
    }
    if ($choice -eq '0') { exit }
    elseif ($scriptMap.ContainsKey($choice)) {
        powershell -ExecutionPolicy Bypass -File "$PSScriptRoot\$($scriptMap[$choice])"
    } else {
        Write-Host "Invalid option."
    }
    Pause
}

do {
    Show-Menu
    $selection = Read-Host "Select an option"
    Run-Command -choice $selection
} while ($true)