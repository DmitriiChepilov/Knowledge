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
