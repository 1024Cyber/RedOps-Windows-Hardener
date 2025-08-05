
function Show-Menu {
    Clear-Host
    Write-Host "          "
    Write-Host "  =============== Threat Hunting & Hardening Toolkit: ADVANCED & SPECIFIC (Targeted Threat Hunting) ===============" 
    Write-Host "          "
    Write-Host "     Developed for: Rapid Threat Detection & Windows Hardening By:  1024-Cybersecurity Services" 
    Write-Host "                  Twitter:   x.com/1024Cyber   " 
    Write-Host "                  LinkedIn:  linkedin.com/in/1024Cyber   "  
    Write-Host "                  Github:    github.com/1024Cyber                 "
    Write-Host "  ================================================================================================================="
    Write-Host "          "
    Write-Host "1.  Identify user accounts created in the last 7 days."
    Write-Host "2.  Check Unsigned Running Processes"
    Write-Host "3.  Detect WMI event subscriptions often abused for persistence."
    Write-Host "4.   Compare hashes of running processes to VirusTotal (optional API integration; manual check fallback included).
    (Note: This version does not contact VirusTotal API (to avoid exposing APIkey). It generates hashes for manual checking!!)"
    Write-Host "5.  Detect Recently Created Executables"
    Write-Host "6.  Detect if executable filetypes are hijacked via shell open commands (e.g., .exe, .bat, .cmd)"
    Write-Host "7.  Dump Active Network Connections"
    Write-Host "8.  Scan for files containing base64 or obfuscated PowerShell code in user folders."
    Write-Host "9.  Find Orphaned Services"
    Write-Host "10. Locate .lnk shortcuts with suspicious paths (e.g., pointing to Temp, AppData, or external drives)."
    Write-Host "11. List non-default accounts with admin privileges."
    Write-Host "12. List recently run executables using Windows Prefetch data (requires admin)."
    Write-Host "13. List scheduled tasks not created by Microsoft.  (user created tasks )"
    Write-Host "14. Scan for executables using Alternate Data Streams (ADS), a known malware technique"
    Write-Host "15. Check for suspicious autostarts in Run and RunOnce registry keys."
    Write-Host "16. Lists Users with RDP Access"
    Write-Host "17. Find hidden executables"
    Write-Host "18. Dump all startup items"
    Write-Host "19. List new services running"
    Write-Host "20. Check persistence registry keys"
    Write-Host "21. Detect hidden schedule tasks"
    Write-Host "22. Get admin logins for the last 7 days"
    Write-Host "23. Detect processes running from Temp, AppData, or user folders (suspicious locations)."

    Write-Host "0.  Exit"
    Write-Host "          "
}

function Run-Command {
    param([string]$choice)
    $scriptMap = @{
        '1' = 'audit_new_accounts_last7days.ps1'
        '2' = 'check_unsigned_processes.ps1'
        '3' = 'check_wmi_persistence.ps1'
        '4' = 'compare_running_processes_virustotal.ps1'
        '5' = 'detect_newly_created_exes.ps1'
        '6' = 'detect_shell_open_command_hijacks.ps1'
        '7' = 'dump_network_connections.ps1'
        '8' = 'find_base64_obfuscated_scripts.ps1'
        '9' = 'find_orphaned_services.ps1'
        '10' = 'find_suspicious_lnk_shortcuts.ps1'
        '11' = 'find_unknown_admins.ps1'
        '12' = 'list_recent_prefetch_executables.ps1'
        '13' = 'list_user_created_tasks.ps1'
        '14' = 'scan_alternate_data_streams.ps1'
        '15' = 'scan_run_runonce_registry.ps1'
        '16' = 'list_users_with_rdp_access.ps1'
        '17' = 'find_hidden_executables.ps1'
        '18' = 'dump_startup_items.ps1'
        '19' = 'list_new_services.ps1'
        '20' = 'check_persistence_regkeys.ps1'
        '21' = 'detect_hidden_schtasks.ps1'
        '22' = 'get_admin_logins_last7days.ps1'
        '23' = 'detect_processes_in_temp_appdata.ps1'
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