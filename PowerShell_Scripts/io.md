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
$Destination = "path/to/new/directory"
if (Test-Path $Destination) {
    Write-Host "cleaning $Destination"
    Get-ChildItem -Path $Destination -Recurse | Remove-Item -force -recurse -Verbose
    Remove-Item $Destination -Force
    Write-Host "cleaning is completed ($Destination)"
} else {
    Write-Host "$Destination does not exist. skip"
}
```