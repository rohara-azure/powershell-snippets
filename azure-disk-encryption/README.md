# Azure Disk Encryption Example

## Prerequisites

Azure VM
AZure KeyVault

## Steps

### KeyVault

1. Create KeyVault if none exists

2. Create a new Encruption Key / Secret. Copy the KeyName and Key Identifier which will look something like this \(https://{{vaultname}}.vault.azure.net/keys/{{keyname}}/{{keyID}}\)

### Run Script

This script will first install the Az module, then establish a connection to Azure by calling Connect-AzAccount and set the Subscription and RG name to be used

1. Open EncryptDisk.ps1

2. Edit params
    - See descriptions in the script

3. Call with .\EncryptDisk.ps1
    - You will get prompted to continue, see below
---

Enable AzureDiskEncryption on the VM
This cmdlet prepares the VM and enables encryption which may reboot the machine and takes 10-15
minutes to finish. Please save your work on the VM before confirming. Do you want to continue?
[Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"):

---