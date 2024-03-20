## Find all services by name
```powershell
Get-Service "win*" | Format-List -Property Name, DisplayName, Status
```


## Getting environment variable ASPNETCORE_ENVIRONMENT using C#
```powershell
$source = @"
public class EnvironmentHelper
{
    public static string GetEnvironmentAspNetCore()
    {
        return System.Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
    }
    public static string GetEnvironmentDotNet()
    {
        return System.Environment.GetEnvironmentVariable("DOTNET_ENVIRONMENT");
    }
}
"@
Add-Type -TypeDefinition $source
$env1 = [EnvironmentHelper]::GetEnvironmentAspNetCore()
$env2 = [EnvironmentHelper]::GetEnvironmentDotNet()
echo "ASPNETCORE Environment: $env1"
echo "    DOTNET Environment: $env2"
```

