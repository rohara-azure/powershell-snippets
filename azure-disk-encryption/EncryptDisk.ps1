# Subscription ID
$subscriptionId = "**placeholer**"
# Name of the resource group where the VM and KeyVault have been created
$resourceGroupName = "**placeholer**"
# Name of the VM to encrypt
$vMName = "**placeholer**" 
# VaultID for the encryption key to use. Navigate to the keyVault that was created and go to properties and grab the "Resource ID". This will look somethign like "/subscriptions/{{sub}}/resourceGroups/{{resource group}}/providers/Microsoft.KeyVault/vaults/{{vaultname}}"
$diskEncryptionKeyVaultId = "**placeholer**" 
# This can be found under properties of the KeyVault, DNS Name
$diskEncryptionKeyVaultUrl = "**placeholer**" 
$volumeType = "All" 
# Same KeyVault as above, adjust if needed
$keyEncryptionKeyVaultId = $diskEncryptionKeyVaultId 
# This is the url for the key created as a prereq, Go to the KeyVault -> Keys -> Key Created, then current version and grab "Key Identifier"
$keyEncryptionKeyUrl = "**placeholer**" 

# set up params
$params = New-Object PSObject -Property @{ 
    ResourceGroupName = $resourceGroupName
    VMName = $vMName
    DiskEncryptionKeyVaultId = $diskEncryptionKeyVaultId
    DiskEncryptionKeyVaultUrl = $diskEncryptionKeyVaultUrl
    VolumeType = $volumeType
	KeyEncryptionKeyVaultId = $keyEncryptionKeyVaultId
    KeyEncryptionKeyUrl = $keyEncryptionKeyUrl
}

# Install Az module
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# Establish Azure connection
Connect-AzAccount -Subscription $subscriptionId

# redundant based on above switch
Set-AzContext -SubscriptionId $subscriptionId

# probably redundant based on params passed to Set-AzVmDiskEncryptionExtension
Set-AzDefault -ResourceGroupName $resourceGroupName

$params | Set-AzVmDiskEncryptionExtension