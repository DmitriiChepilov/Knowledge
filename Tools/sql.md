## SQLite

[DB Browser for SQLite](https://sqlitebrowser.org/dl/)

## SQL Server Management Studio (SSMS)

### Setting up the dark theme in SQL Server Management Studio

[original article](https://www.sqlshack.com/setting-up-the-dark-theme-in-sql-server-management-studio/)

| version | path                                                                                       |
| ------- | ------------------------------------------------------------------------------------------ |
| SSMS 19 | C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\ssms.pkgundef |
| SSMS 20 | C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE\ssms.pkgundef |

replace (comment 1 line)

```sh
// Remove Dark theme
[$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]
```

to

```sh
// Remove Dark theme
// [$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]
```
