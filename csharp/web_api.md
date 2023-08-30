
## Configure new web app with Serilog
```csharp
public static void Main(string[] args)
{
  Host.CreateDefaultBuilder(args)
    .UseSerilog((context, services, configuration) => configuration
      .ReadFrom.Configuration(context.Configuration))
    .ConfigureWebHostDefaults(webBuilder =>
    {
      webBuilder.UseIISIntegration()
        .UseStartup<Startup>();
    })
    .UseDefaultServiceProvider((context, options) =>
    {
      options.ValidateOnBuild = false;
    })
    .Build()
    .Run();
}
```


## Consuming HttpClient
instead of this
```csharp
using var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();
var raw = await response.Content.ReadAsStringAsync();
var result = JsonConvert.DeserializeObject<IEnumerable<BusinessUnit>>(raw);
```

use `Content.ReadAsAsync` (with library `Microsoft.AspNet.WebApi.Client`):
```csharp
using var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();
var result = await response.Content.ReadAsAsync<IEnumerable<BusinessUnit>>();
```