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

## Deserialize JSON file to object

```csharp
public static async Task<T> DeserializeFromFileAsync<T>(
    IFileSystem fileSystem,
    string fileFullPath,
    CancellationToken cancellationToken = default)
{
    using (var fileStream = fileSystem.FileStream.Create(fileFullPath, FileMode.Open, FileAccess.Read))
    {
        return await JsonSerializer.DeserializeAsync<T>(fileStream, cancellationToken);
    }
}
```
