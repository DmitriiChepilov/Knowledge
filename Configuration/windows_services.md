PowerShell scipt for adding new service:

# Install using PowerShell

```powershell
$params = @{
  Name = "ServiceID"
  BinaryPathName = '"C:\path\to\service.exe"'
  DisplayName = "Service friendly name"
  StartupType = "Automatic"
  Description = "Details about service"
}
New-Service @params
```

# Uninstall

```powershell
Remove-Service -Name "YourServiceName"
#or
sc.exe delete "YourServiceName"
```

## Updating existing service

```powershell
sc.exe config MyServiceID binpath= c:\new\path\to\myService.exe
```

[More Info](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sc-config)

## Force stop

```powershell
Stop-Service -Name "YourServiceName" -Force -NoWait -Confirm
```
