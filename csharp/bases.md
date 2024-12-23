## First app. Host.CreateDefaultBuilder vs WebApplication.CreateBuilder vs Host.CreateApplicationBuilder

[answer](https://github.com/dotnet/runtime/discussions/81090#discussioncomment-4784551)
We moved away from the ceremony of a generic host in the default templates and to the scenario specific WebApplicationBuilder. The general idea was to move away from calbacks and move to linear code for configuring everything, this was part of .NET 6. In .NET 7, we added var builder = Host.CreateApplicationBuilder() as the backbone of WebApplication.CreateBuilder so we could have a smoother integration of the API styles (building the linear API on top of the callback API was error prone). As a result, we now have a similar pattern to WebApplicationBuilder for non-web scenarios:

### First app. Web

```csharp
var builder = WebApplication.CreateBuilder();
builder.Logging.AddConsole();
builder.Services.AddOptions<MyOptions>().BindConfiguration("MyConfig");
builder.Services.AddHostedService<MyWorker>();
var app = builder.Build();
app.MapGet("/", () => "Hello World");
app.Run();
```

### First app. Non-Web

```csharp
var builder = Host.CreateApplicationBuilder();
builder.Logging.AddConsole();
builder.Services.AddOptions<MyOptions>().BindConfiguration("MyConfig");
builder.Services.AddHostedService<MyWorker>();
var host = builder.Build();
host.Run();
```
