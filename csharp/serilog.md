
## Add scoped parameter
```csharp
using var scope = _logger.BeginScope("TaskId: {TaskId}", task.Id);
```