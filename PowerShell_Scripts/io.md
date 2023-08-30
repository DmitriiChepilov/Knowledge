# Work with files & directories

## Creating a new folder
```powershell
New-Item -Path '$(System.ArtifactsDirectory)/new_directory' -ItemType Directory
```

## Delete folder with files
```powershell
$Destination = "$(Build.BinariesDirectory)\sdl_tool_zip"
if (Test-Path $Destination) {
    Write-Host "cleaning $Destination"
    Get-ChildItem -Path $Destination -Recurse | Remove-Item -force -recurse -Verbose
    Remove-Item $Destination -Force
    Write-Host "cleaning is completed ($Destination)"
} else {
    Write-Host "$Destination does not exist. skip"
}
```