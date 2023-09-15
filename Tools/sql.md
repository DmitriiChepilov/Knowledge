## SQLite
[DB Browser for SQLite](https://sqlitebrowser.org/dl/)

## SQL Server Management Studio (SSMS)
### Setting up the dark theme in SQL Server Management Studio
[original article](https://www.sqlshack.com/setting-up-the-dark-theme-in-sql-server-management-studio/)
C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\ssms.pkgundef
replace
```
// Remove Dark theme
[$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]
```
to
```
// Remove Dark theme
// [$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]
```
