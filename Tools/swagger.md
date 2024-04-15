
[Get started with NSwag and ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-nswag?view=aspnetcore-7.0&tabs=visual-studio)

[NSwagStudio](https://github.com/RicoSuter/NSwag/releases)

Good article about Swagger (OpenAPI 3.0)
https://habr.com/ru/articles/541592/


Make API client with informative error when it has a deserialize problem
```csharp
public SomeClientAdapter(ISomeApiClient client)
{
  _client = client;
  ((SomeApiClient) _client).ReadResponseAsString = true;
}
```