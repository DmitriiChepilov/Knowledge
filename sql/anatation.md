## anataion

```sql
EXECUTE sp_addextendedproperty
  @name = N'MS_Description',
  @value = N'0 - Unknown,
1 - on,
2 - off',
  -- which scheme
  @level0type = N'SCHEMA',
  @level0name = N'dbo',
  -- which table
  @level1type = N'TABLE',
  @level1name = N'student',
  -- which column
  @level2type = N'COLUMN',
  @level2name = N'studentType';
```
