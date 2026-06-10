## IAsyncEnumerable

```csharp
public class OrderService : IOrderService
{
  public async IAsyncEnumerable<Order> GetOrders(
    IEnumerable<int> ids,
    [EnumeratorCancellation] CancellationToken token = default)
  {
    foreach (var chunkIds in ids.Chunk(ChunkSize))
    {
      await foreach (var validOrders in GetOrdersImpl(chunkIds, token))
      {
        yield return validOrders;
      }
    }
  }

  private async IAsyncEnumerable<string> GetOrdersImpl(
    IReadOnlyCollection<int> ids,
    [EnumeratorCancellation] CancellationToken token)
  {
    var validOrders = await dbContext.Orders.GetValidOrders(ids, token);

    foreach (var id in ids)
    {
      if (validOrders.Any(x => x.Id == id))
      {
        yield return validOrder;
      }
    }
  }
}
// Usage #1. foreach order async
await foreach (var order in _orderService.GetOrders(orderIds, token))
{
  //...
}
// Usage #2. convert to array
var orders = await _orderService.GetOrders(orderIds, token).ToArrayAsync(token);
```
