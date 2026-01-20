# System.Text.Json:

## How do I specify a custom name for an enum value?

Use: JsonStringEnumConverter & JsonStringEnumMemberName

```csharp
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum ReportStatus
{
    Ok,
    Error,
    [JsonStringEnumMemberName("do-not-know")]
    DontKnow,
}
```
