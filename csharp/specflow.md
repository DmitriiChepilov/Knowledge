## file specflow.json

```json
{
  "$schema": "https://specflow.org/specflow-config.json",
  "generator": {
    "allowRowTests": false
  }
}
```

## Write to log

```csharp
TestContext.Error.WriteLine("message");
```

## Mark test as Unstable

```
@Unstable
```
