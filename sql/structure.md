## Структура базы данных и существующие схемы

```sql
SELECT
	s.name AS SchemaName,
	t.name AS TableName
FROM sys.tables AS t
	INNER JOIN sys.schemas AS s
		ON t.schema_id = s.schema_id
ORDER BY s.name, t.name
```

## Какие индексы существуют в базе данных?

```sql
SELECT
	SCHEMA_NAME(t.schema_id) AS SchemaName,
	t.name AS TableName,
	i.name AS IndexName,
	i.type_desc AS IndexType
FROM sys.indexes AS i
	INNER JOIN sys.tables AS t
		ON i.object_id = t.object_id
WHERE i.type > 0
ORDER BY SchemaName, TableName, IndexName;
```
