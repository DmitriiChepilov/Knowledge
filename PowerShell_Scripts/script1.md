Invoke POST request

Invoke-WebRequest -UseBasicParsing $(link) -ContentType "application/json" -Method POST -Body '$(json_body)'
[Console]::ReadKey()

where
$(link) - link to web API
$(json_body) - JSON body



Invoke GET request
Invoke-WebRequest -UseBasicParsing $(link) -Method GET




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



## Find all services by name
```powershell
Get-Service "win*" | Format-List -Property Name, DisplayName, Status
```