# Set 'Deny access to this computer from the network' policy

# Define the accounts to be denied network access
$accounts = @('Guests', 'Local account', 'Administrators')

# Loop through the accounts and set the policy
foreach ($account in $accounts) {
    $policyPath = "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0\$account"
    $existingValue = Get-ItemProperty -Path $policyPath -Name 'BackConnectionHostNames' -ErrorAction SilentlyContinue

    if ($existingValue) {
        $newValue = $existingValue.BackConnectionHostNames + ',localhost'
    } else {
        $newValue = 'localhost'
    }

    Set-ItemProperty -Path $policyPath -Name 'BackConnectionHostNames' -Value $newValue
}

# Refresh the Group Policy
gpupdate /force
