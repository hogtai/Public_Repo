# Set 'Deny access to this computer from the network' policy

# Define the accounts to be denied network access
$accounts = @('Guests', 'NT AUTHORITY\Local account', 'BUILTIN\Administrators')

# Loop through the accounts and set the policy
foreach ($account in $accounts) {
    $policyPath = "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0\$account" #your path might be different
    $existingValue = Get-ItemProperty -Path $policyPath -Name 'RestrictAnonymous'

    if ($existingValue.RestrictAnonymous -ne 1) {
        Set-ItemProperty -Path $policyPath -Name 'RestrictAnonymous' -Value 1
    }
}

# Refresh the Group Policy
gpupdate /force
