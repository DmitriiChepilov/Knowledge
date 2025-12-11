```csharp
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
}

class Program
{
    static async Task Main(string[] args)
    {
        var users = new List<User>
        {
            new User { Id = 1, Name = "Alice" },
            new User { Id = 2, Name = "Bob" },
            new User { Id = 3, Name = "Charlie" },
            new User { Id = 4, Name = "David" },
            new User { Id = 5, Name = "Eve" },
            new User { Id = 6, Name = "Frank" },
            new User { Id = 7, Name = "Grace" },
            new User { Id = 8, Name = "Henry" },
            new User { Id = 9, Name = "Ivy" },
            new User { Id = 10, Name = "Jack" }
        };

        // Отправляем уведомления с ограничением параллелизма до 8
        await SendNotificationsAsync(users, maxParallelism: 8, CancellationToken.None);
    }

    static async Task SendNotificationsAsync(
        List<User> users,
        int maxParallelism,
        CancellationToken cancellationToken = default)
    {
        var semaphore = new SemaphoreSlim(maxParallelism, maxParallelism);

        var tasks = users.Select(async user =>
        {
            cancellationToken.ThrowIfCancellationRequested();
            await semaphore.WaitAsync(cancellationToken);
            try
            {
                cancellationToken.ThrowIfCancellationRequested();
                await SendNotificationAsync(user);
            }
            finally
            {
                semaphore.Release();
            }
        }).ToList();

        await Task.WhenAll(tasks);
    }

    static async Task SendNotificationAsync(User user)
    {
        // Имитация асинхронной операции отправки уведомления
        await Task.Delay(100);
        Console.WriteLine($"Уведомление отправлено пользователю: {user.Name}");
    }
}
```
