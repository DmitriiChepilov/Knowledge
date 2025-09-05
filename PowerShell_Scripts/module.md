## How to install PowerShell module on offline computer

Base on article [How to Install PowerShell Modules on Offline Computers?](https://woshub.com/install-powershell-module-offline/)

1. Download the module to the specified local folder on your computer:

```powershell
Save-Module –Name CredentialManager –Path C:\PS\
```

2. Copy the folder to another computer you want to install the module on.

Let’s see what folders PowerShell modules are stored in:

```powershell
$env:PSModulePath -split ";"
```

Copy the module to `C:\Program Files\WindowsPowerShell\Modules`

Make sure that the CredentialManager module is now available:

```powershell
Get-Module -Name CredentialManager -ListAvailable
```

Display the list of commands available in the module:

```powershell
Get-Command -Module CredentialManager
```

3. Use

```powershell
Import-Module -Name CredentialManager
Get-StoredCredential -Target "MY_SECRET"
```
