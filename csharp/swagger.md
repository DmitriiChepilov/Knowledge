## How to add swagger to project

1. Add GenerateDocumentationFile to project
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
  <PropertyGroup>
    <Product>my Web Api</Product>
    <TargetFramework>net7.0</TargetFramework>
    <GenerateDocumentationFile>true</GenerateDocumentationFile><!-- here add XML file renegation -->
  </PropertyGroup>
</Project>
```

2. Add comments from XML file
```csharp
  services.AddSwaggerGen(c =>
  {
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "my API", Version = "v1" });
    
    // Set the comments path for the Swagger JSON and UI.
    var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    c.IncludeXmlComments(xmlPath); // here add comments from XML file
  });
```