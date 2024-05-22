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