
## Decorator
pattern

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

```csharp
builder.RegisterType<UserService>().As<IUserService>();
builder.RegisterDecorator<StateHistoryUserServiceDecorator, IUserService>();
var container = builder.Build();

var service = container.Resolve<IUserService>();
```

