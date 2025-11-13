## Run Credential Manager

```powershell
control.exe keymgr.dll
control.exe /name Microsoft.CredentialManager
rundll32.exe keymgr.dll, KRShowKeyMgr

#clean history
Remove-Item -Path (Get-PSReadLineOption).HistorySavePath
```

## Cleanup

Removes all superseded versions of every component in the component store. [Clean Up the WinSxS Folder](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/clean-up-the-winsxs-folder)

> [!WARNING]  
> All existing update packages can't be uninstalled after this command is completed, but this won't block the uninstallation of future update packages.

```powershell
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
```

Cleaning C:\Windows\ccmcache folder. [FIX: CCMCache folder grows exponentially](https://www.reddit.com/r/SCCM/comments/16copla/fix_ccmcache_folder_grows_exponentially/)
Script 1:

```powershell
$SCCMClient = New-Object -ComObject UIResource.UIResourceMgr
$SCCMCache = $SCCMClient.GetCacheInfo()
$SCCMCacheDir = $SCCMClient.GetCacheInfo().Location
$SCCMActiveCache = @($SCCMClient.GetCacheInfo().GetCacheElements() | select -ExpandProperty Location)
$SCCMCache.GetCacheElements() | where-object {[datetime]$_.LastReferenceTime -lt (get-date).adddays(-30)} |  foreach {$SCCMCache.DeleteCacheElement($_.CacheElementID)}
Get-ChildItem -Path $SCCMCacheDir | where-object {(($_.PsIsContainer -eq $true) -and ($SCCMActiveCache -notcontains $_.FullName) -and ([datetime]$_.LastWriteTime -lt (get-date).adddays(-30)))} | Remove-item -force -recurse
```

Script 2:

```powershell
## read out size of cache before start
echo "Cache GB"
[math]::round((((Get-ChildItem -s "c:\windows\ccmcache" | Measure-Object -Property Length -sum | Select-Object -ExpandProperty Sum)/1024)/1024)/1024,2)
## Initialize the CCM resource manager com object
[__comobject]$CCMComObject = New-Object -ComObject 'UIResource.UIResourceMgr'
## Get the CacheElementIDs to delete
$CacheInfo = $CCMComObject.GetCacheInfo().GetCacheElements()
## Remove cache items
ForEach ($CacheItem in $CacheInfo) {
  $null = $CCMComObject.GetCacheInfo().DeleteCacheElement([string]$($CacheItem.CacheElementID))
}
##read out cache size after clearning, 0 will not show up and should be blank
echo "now GB"
[math]::round((((Get-ChildItem -s "c:\windows\ccmcache" | Measure-Object -Property Length -sum | Select-Object -ExpandProperty Sum)/1024)/1024)/1024,2)
```


To run the System applet as a user named "Admin", you would type: 
```sh
runas /user:Admin "rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl"
```
