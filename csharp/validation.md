## Validation in class

```csharp
class User{
  public User(
    string userName,
    int levelId)
  {
    ArgumentException.ThrowIfNullOrEmpty(userName);
    ArgumentOutOfRangeException.ThrowIfNegativeOrZero(levelId);

    UserName = userName;
    LevelId = levelId;
  }

  public string UserName { get; }

  public string LevelId { get; }
}
```
