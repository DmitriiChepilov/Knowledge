##Exception Arithmetic overflow error converting IDENTITY to data type int. Arithmetic overflow occurred.

```sql
select IDENT_CURRENT('[dbo].[TableName]')
-- 2147483647

DBCC CHECKIDENT('[dbo].[TableName]' ,NORESEED)
-- Checking identity information: current identity value '2147483647', current column value 'NULL'.
```
