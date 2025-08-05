# Enable Windows Defender ASR (Attack Surface Reduction) Rules

$path = "$env:USERPROFILE\Desktop\enable_defender_asr.txt"
$rules = @(
    "D4F940AB-401B-4EFC-AADC-AD5F3C50688A",  # Block credential stealing
    "3B576869-A4EC-4529-8536-B80A7769E899",  # Block Office from creating child processes
    "75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84"   # Block executable content from email/webmail
)
foreach ($rule in $rules) {
    Add-MpPreference -AttackSurfaceReductionRules_Ids $rule -AttackSurfaceReductionRules_Actions Enabled
}
"ASR rules enabled" | Out-File -FilePath $path

Write-Host "ASR rules enabled"

Write-Host "Output saved to: " $path