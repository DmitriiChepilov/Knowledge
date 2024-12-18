# Work with files & directories

## Creating a new directory

```powershell
New-Item -Path 'path/to/new/directory' -ItemType Directory
```

## Creating a directory if it does not exist

```powershell
$path = "path/to/new/directory"
If(!(test-path -PathType container $path))
{
  New-Item -ItemType Directory -Path $path
}
```

## Delete folder with files

```powershell
$pathToFolder = "path/to/folder"
if (Test-Path $pathToFolder) {
    Write-Host "cleaning $pathToFolder"
    Get-ChildItem -Path $pathToFolder -Recurse | Remove-Item -force -recurse -Verbose
    Remove-Item $pathToFolder -Force
    Write-Host "cleaning is completed ($pathToFolder)"
} else {
    Write-Host "Path $pathToFolder does not exist. skip"
}
```

or

```powershell
Remove-Item -LiteralPath 'C:\path\to\folder' -Force -Recurse
```

## Delete file if it exists

```powershell

$pathToFile = "c:\Temp\file.txt"
if (Test-Path $pathToFile) {
  Write-Host "Deleting $pathToFile"
  Remove-Item -LiteralPath "$pathToFile" -Force
  Write-Host "File $pathToFile is deleted"
} else {
  Write-Host "File $pathToFile does not exist. skip"
}
```

## Delete folder recursively if it exists

```powershell
function Remove-ItemRecurse {
  param (
      [string]$path
  )

  if (Test-Path $path) {
    Write-Host "Deleting $path"
    Remove-Item -LiteralPath $path -Force -Recurse
    Write-Host "$path is deleted"
  } else {
    Write-Host "$path does not exist. skip"
  }
}
Remove-ItemRecurse -Path "c:\Temp\path1"
Remove-ItemRecurse -Path "c:\Temp\path2"
```

## Play sound when done

```powershell
(New-Object -ComObject Sapi.spvoice).speak("Hey, $(([adsi]"LDAP://$(whoami /fqdn)").givenName), your BAT file is finished!")
```
