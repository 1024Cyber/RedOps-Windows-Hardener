
function Show-Menu {
    Clear-Host
    Write-Host "          "
    Write-Host "  ================== Threat Hunting & Hardening Toolkit: AGGRESSIVE & STRATEGIC (Hardening) ======================"
    Write-Host "          " 
    Write-Host "     Developed for: Rapid Threat Detection & Windows Hardening By:  1024-Cybersecurity Services" 
    Write-Host "                  Twitter:   x.com/1024Cyber   " 
    Write-Host "                  LinkedIn:  linkedin.com/in/1024Cyber   "  
    Write-Host "                  Github:    github.com/1024Cyber                 "
    Write-Host "  ================================================================================================================="
    Write-Host "          "
    Write-Host "1.  Audit and Harden Local Security Policy via secedit templates."
    Write-Host "2.  Block Access to CMD/PowerShell for Non-Admin Users"
    Write-Host "3.  Block Known LOLBins (Living off the Land Binaries) via Hash or Path Rules."
    Write-Host "4.  Block Macro Execution in Office via Registry  (Example: mshta, regsvr32) "
    Write-Host "5.  Configure Windows Firewall to Block All Outbound Except Whitelist"
    Write-Host "6.  Disable Guest Account"
    Write-Host "7.  Disable LSASS Dumping via Registry"
    Write-Host "8.  Disable Script Execution via Registry (CMD, BAT, VBS)"
    Write-Host "9.  Disable Script Execution via Group Policy (CMD, BAT, VBS)"
    Write-Host "10. Disable Windows Installer for Standard Users"
    Write-Host "11. Enable Windows Defender ASR (Attack Surface Reduction) Rules"
    Write-Host "12. Enable Full Command-Line Process Auditing via Sysmon or AuditPol"
    Write-Host "13. Enable Logging for PowerShell Module/Script Block Events"
    Write-Host "14. Enable Windows Firewall"
    Write-Host "15. Force User Account Control (UAC) to Always Prompt for Admin Consent."
    Write-Host "16. Restrict RDP to Specific Local Admins Only"
    Write-Host "17. Set Automatic Logout on Idle Sessions"
    Write-Host "18.  Whitelist Only Specific USB Devices (Device Installation Restrictions)"

    Write-Host "0.  Exit"
    Write-Host "          "
}

function Run-Command {
    param([string]$choice)
    $scriptMap = @{
        '1' = 'audit_harden_local_policy.ps1'
        '2' = 'block_cmd_powershell_non_admin.ps1'
        '3' = 'block_known_lolbins.ps1'
        '4' = 'block_macro_execution_office.ps1'
        '5' = 'configure_firewall_whitelist.ps1'
        '6' = 'disable_guest_account.ps1'
        '7' = 'disable_lsass_dumping.ps1'
        '8' = 'disable_script_execution_reg.ps1'
        '9' = 'disable_script_execution_gpo.ps1'
        '10' = 'disable_windows_installer.ps1'
        '11' = 'enable_defender_asr.ps1'
        '12' = 'enable_full_cmd_audit.ps1'
        '13' = 'enable_ps_logging.ps1'
        '14' = 'enable_windows_firewall.ps1'
        '15' = 'force_uac_prompt.ps1'
        '16' = 'restrict_rdp_local_admins.ps1'
        '17' = 'set_idle_logout.ps1'
        '18' = 'whitelist_usb_devices.ps1'

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