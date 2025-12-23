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
