```csharp
using LinqSpecs;

public partial class User
{
  public static AdHocSpecification<User> ById(int id)
  {
    return new(x => x.Id == id);
  }

  public static readonly Func<User, bool> ByIdFunc = ById().ToExpression().Compile();
}
...
var bpSettings = await dbContext.User.SingleOrDefaultAsync(User.ById(userId), cancellationToken);
```
