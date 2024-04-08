
## Send GET request using `ResponseHeadersRead`
```csharp
string link = "https://some_link.com";
using var request = new HttpRequestMessage(HttpMethod.Get, link);
using var responseMessage = await _client.SendAsync(request, HttpCompletionOption.ResponseHeadersRead);
response.EnsureSuccessStatusCode();
string content = await response.Content.ReadAsStringAsync();
var object = JsonConvert.DeserializeObject<FooBar>(content);
```