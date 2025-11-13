## Offline installition

Download https://wslstorestorage.blob.core.windows.net/wslblob/Ubuntu2404-240425.AppxBundle from https://learn.microsoft.com/en-us/windows/wsl/install-manual#downloading-distributions

```powershell
Add-AppxPackage .\Ubuntu2404-240425.AppxBundle
wsl --unregister Ubuntu-24.04
```

## Uninstall / Unregister

```powershell
wsl --unregister Ubuntu-24.04
```


## Links
* [Docker For Dot Net Developer](https://github.com/dubeytapan12/DockerForDotNetDeveloper/)