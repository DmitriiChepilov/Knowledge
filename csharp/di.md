## 1 Register Decorator

### 1.1 Decorator pattern

```csharp
public interface IUserService
{
  Task<User> GetById(int id);
}

public class UserService : IUserService
{
  private readonly IUserRepository _repository;

  public UserService(IUserRepository repository)
  {
    _repository = repository;
  }

  public Task<User> GetById(int id)
  {
    return _repository.GetById(id);
  }
}

public class StateHistoryUserServiceDecorator : IUserService
{
  private readonly IUserService _userService;
  private readonly IUserStateHistoryService _userStateHistoryService;

  public StateHistoryUserServiceDecorator(
    IUserService userService,
    IUserStateHistoryService userStateHistoryService)
  {
    _userService = userService;
    _userStateHistoryService = userStateHistoryService;
  }

  public Task<User> GetById(int id)
  {
    // do special logic
    return _userService.GetById(id);
  }
```

### 1.2 Microsoft DI

```csharp
collection.AddTransient(CreateUserService);
//...
private static IUserService CreateUserService(IServiceProvider provider)
{
  var userRepository = provider.GetRequiredService<IUserRepository>();
  var userService = new UserService(userRepository);

  var userStateHistoryService = provider.GetRequiredService<IUserStateHistoryService>();
  return new StateHistoryUserServiceDecorator(userService, userStateHistoryService);
}
```

### 1.3 Autofac

```csharp
builder.RegisterType<UserService>().As<IUserService>();
builder.RegisterDecorator<StateHistoryUserServiceDecorator, IUserService>();
var container = builder.Build();

var service = container.Resolve<IUserService>();
```

### 1.4 Windsor

## How to register decorator

```csharp
// interface
public interface IThing
{
  string SayHello(string name);
}

// implementation
public class ThingOne : IThing
{
  public string SayHello(string name)
  {
    return string.Format("ThingOne says hello to {0}", name);
  }
}

// decorator
public class ThingDecorator : IThing
{
  private readonly IThing thing;

  public ThingDecorator(IThing thing)
  {
    this.thing = thing;
  }

  public string SayHello(string name)
  {
    Console.WriteLine("Before calling wrapped IThing");
    var message = thing.SayHello(name);
    Console.WriteLine("After calling wrapped IThing");
    return message;
  }
}

// register decorator
var container = new WindsorContainer();
container.Register(
    Component.For<IThing>().ImplementedBy<ThingDecorator>(),
    Component.For<IThing>().ImplementedBy<ThingOne>()
    );

```

Source link: [Here’s part four of (at least) 10 Advanced Windsor Trick](https://mikehadlow.blogspot.com/2010/01/10-advanced-windsor-tricks-4-how-to.html)

## Как зарегистрировать через стандартный механизм класс с настройками?

В C# для регистрации класса с настройками через стандартный механизм можно использовать `Microsoft.Extensions.Configuration` и `Microsoft.Extensions.DependencyInjection`. Вот как это делается:

1. Создайте класс настроек:

```csharp:$PROJECT/Settings/MySettings.cs
using Microsoft.Extensions.Options;

namespace MyProject.Settings
{
    public class MySettings
    {
        public string ConnectionString { get; set; } = string.Empty;
        public int Timeout { get; set; } = 30;
    }
}
```

2. В `Program.cs` или `Startup.cs` зарегистрируйте настройки:

```csharp:$PROJECT/Program.cs
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using MyProject.Settings;

var builder = Host.CreateApplicationBuilder(args);

// Регистрация настроек
builder.Services.Configure<MySettings>(
    builder.Configuration.GetSection("MySettings"));
// или
builder.Services.Configure<MySettings>(builder.Configuration.GetRequiredSection(nameof(MySettings)));

// Или если используете IOptions<T>
builder.Services.AddOptions<MySettings>()
    .Bind(builder.Configuration.GetSection("MySettings"));

// Регистрация сервиса, который будет использовать настройки
builder.Services.AddTransient<IMyService, MyService>();

var host = builder.Build();
```

3. В классе сервиса используйте настройки:

```csharp:$PROJECT/Services/MyService.cs
using Microsoft.Extensions.Options;
using MyProject.Settings;

public interface IMyService
{
    void DoSomething();
}

public class MyService : IMyService
{
    private readonly MySettings _settings;

    public MyService(IOptions<MySettings> settings)
    {
        _settings = settings.Value;
    }

    public void DoSomething()
    {
        Console.WriteLine($"Connection string: {_settings.ConnectionString}");
        Console.WriteLine($"Timeout: {_settings.Timeout}");
    }
}
```

4. В файле конфигурации (appsettings.json) добавьте секцию настроек:

```json:$PROJECT/appsettings.json
{
  "MySettings": {
    "ConnectionString": "Server=localhost;Database=Test;Trusted_Connection=true;",
    "Timeout": 60
  }
}
```

Этот подход использует встроенные механизмы DI и Configuration из .NET Core/5+ и является рекомендуемым способом работы с настройками приложений.

## Пишем кеширующий декоратор

1. install Caching.Memory (\*.csproj file)

```xml
  <ItemGroup>
    <PackageReference Include="Microsoft.Extensions.Caching.Memory" Version="9.0.1" />
  </ItemGroup>
```

2. create class CachedUserProviderDecorator

```csharp
public class CachedUserProviderDecorator : IUserProvider
{
    private const string CACHE_KEY = nameof(CachedUserProviderDecorator);

    private static readonly TimeSpan CacheEntryExpiration = TimeSpan.FromMinutes(10);

    private readonly IUserProvider _userProvider;
    private readonly IMemoryCache _memoryCache;

    public CachedUserProviderDecorator(
        IUserProvider UserProvider,
        IMemoryCache memoryCache)
    {
        _userProvider = UserProvider;
        _memoryCache = memoryCache;
    }

    public Task<DateOnly[]> GetUserById(
        int userId,
        CancellationToken cancellationToken = default)
    {
        return _memoryCache.GetOrCreateAsync(CACHE_KEY, async entry =>
        {
            entry.SetAbsoluteExpiration(CacheEntryExpiration);

            return await _userProvider.GetUsers(userId, cancellationToken);
        });
    }
}
```

3. register in DI: Startup.cs

```csharp
using Microsoft.Extensions.Caching.Memory;

public void ConfigureServices(IServiceCollection services)
{
    collection.AddMemoryCache();
    collection.AddTransient(CreateUserProviderProduction);
}

private static IUserProvider CreateUserProviderProduction(IServiceProvider provider)
{
    var userProvider = new UserProvider(...);

    var memoryCache = provider.GetRequiredService<IMemoryCache>();
    return new CachedUserProviderDecorator(databaseUserProviderDecorator, memoryCache);
}
```
