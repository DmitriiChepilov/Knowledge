## Creating global.json

The global.json file allows you to define which .NET SDK version is used when you run .NET CLI commands. [Article](https://learn.microsoft.com/en-us/dotnet/core/tools/global-json)

```sh
dotnet new globaljson --sdk-version 9.0.100 --roll-forward latestFeature
```

or create it manually

```json
{
  "sdk": {
    "version": "9.0.100",
    "rollForward": "latestFeature"
  },
  "msbuild-sdks": {
    "version": "9.0.100",
    "rollForward": "latestFeature"
  }
}
```

## Difference Between `dotnet build` And `dotnet publish`

If you were trying to publish a new app you could

```sh
dotnet restore
dotnet build --no-restore
dotnet publish --no-build
#but just running dotnet publish will do the same.
```
