# Configure Attack Surface Reduction (ASR) rule

# Define the ASR rule ID
$ruleID = '26190899-1602-49e8-8b27-eb1d0a1ce869'

# Check if the ASR rule exists and set the state to 'Enabled'
$asrRule = Get-MpPreference | Select-Object -ExpandProperty AttackSurfaceReductionRules_Ids -ErrorAction SilentlyContinue
if ($asrRule -notcontains $ruleID) {
    $asrRule += $ruleID
    Set-MpPreference -AttackSurfaceReductionRules_Ids $asrRule
}
