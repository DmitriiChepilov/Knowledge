## Map object property with int[]? type to varchar in database using HasConversion

```csharp
public sealed class StudentMap : IEntityTypeConfiguration<Student>
{
    /// <inheritdoc />
    public void Configure(EntityTypeBuilder<Student> entity)
    {
        entity.ToTable("Student", StudentSchema);

        entity.Property(e => e.Id).HasColumnName("ID");

        entity.Property(e => e.StatusIds).HasConversion(
            ids => JsonSerializer.Serialize(ids, JsonSerializerOptions.Default),
            s => JsonSerializer.Deserialize<int[]?>(s, JsonSerializerOptions.Default));
    }
}
```

```sql
CREATE TABLE [dbo].[Student] (
    [ID]                INT                IDENTITY (1, 1) NOT NULL,
    [StatusIds]         NVARCHAR (4000)    NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([ID] ASC)
);
```

## Load collection

```csharp
await _dbContext.Entry(student).Collection(r => r.Rooms).LoadAsync(ct);
```

## Execute stored procudure

```csharp
await _dbContext.Database.ExecuteSqlRawAsync(
    "EXEC dbo.ProcName @Param1, @Param2",
    new SqlParameter("@Param1", value1),
    new SqlParameter("@Param2", value2));
// with simple type
await _dbContext.Database.ExecuteSqlInterpolatedAsync(
    $"EXEC dbo.ProcName @Param1 = {value1}, @Param2 = {value2}");
```

## Entity with json serialized property

```csharp
public class Bar {}
public class FooEntity
{
    public FooEntity(
        string[]? fruits,
        Bar? bars)
    {
        Fruits = fruits;
        Bars = bars;
    }

    public string[]? Fruits { get; private set; }
    public Bar? Bars { get; private set; }
}

public sealed class BasesPublicationSettingsMap : IEntityTypeConfiguration<FooEntity>
{
    public void Configure(EntityTypeBuilder<FooEntity> entity)
    {
        entity.ToTable("Foo", PredefinedConst.MySchema);

        // [Fruits] NVARCHAR (255) DEFAULT ('["appble", "orange", "beans"]') NOT NULL
        entity.Property(e => e.Fruits).HasMaxLength(255)
            .HasConversion(
                fruits => JsonSerializer.Serialize(fruits, JsonSerializerOptions.Default),
                s => JsonSerializer.Deserialize<string[]?>(s, JsonSerializerOptions.Default));

        //  [Bars] NVARCHAR (MAX) NULL,
        entity.Property(e => e.Bars).HasColumnType("NVARCHAR(MAX)")
            .HasConversion(
                bars => bars == null
                    ? null
                    : JsonSerializer.Serialize(bars, JsonSerializerOptions.Default),
                static s => string.IsNullOrWhiteSpace(s)
                    ? null
                    : JsonSerializer.Deserialize<Bar>(s, JsonSerializerOptions.Default));
    }
}
```
