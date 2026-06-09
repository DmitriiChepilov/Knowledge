## Filter

```csharp

public interface IOrderFilter
{
  public bool SkipBlocked { get; }

  static public IOrderFilter Filter(bool skipBlocked = false)
  {
    return new OrderFilter(SkipBlocked: skipBlocked);
  }
}

file record OrderFilter(bool SkipBlocked) : IOrderFilter
```
