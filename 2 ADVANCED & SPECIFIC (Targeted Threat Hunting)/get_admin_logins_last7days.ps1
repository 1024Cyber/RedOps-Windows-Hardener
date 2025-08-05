# Script: get_admin_logins_last7days.ps1
# Purpose: Detect logins by administrative accounts within the last 7 days
# Output: Saves to Desktop as "admin_logins_last7days.txt"

# Get output file path
$desktopPath = [Environment]::GetFolderPath("Desktop")
$outputFile = Join-Path $desktopPath "admin_logins_last7days.txt"

# Get date 7 days ago
$startDate = (Get-Date).AddDays(-7)

# Get list of admin users from Administrators group
$adminGroup = [ADSI]"WinNT://./Administrators,group"
$adminMembers = @()
$adminGroup.Invoke("Members") | ForEach-Object {
    $member = $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
    $adminMembers += $member
}
$adminUsers = $adminMembers | Sort-Object -Unique

# Search Security event logs for successful logon events (Event ID 4624)
$events = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4624
    StartTime = $startDate
} -ErrorAction SilentlyContinue

$adminLogins = @()

foreach ($event in $events) {
    $message = $event.Message
    $timestamp = $event.TimeCreated

    foreach ($admin in $adminUsers) {
        # Escape special characters to avoid ArgumentException from -match
        if ($message -match [regex]::Escape($admin)) {
            $adminLogins += "$timestamp - $message"
            break
        }
    }
}

# Write results
if ($adminLogins.Count -gt 0) {
    $adminLogins | Out-File -Encoding UTF8 -FilePath $outputFile
    Write-Host "Admin login records saved to: $outputFile"
} else {
    "No admin logins in last 7 days." | Out-File -Encoding UTF8 -FilePath $outputFile
    Write-Host "No admin logins found. Output saved to: $outputFile"
}
