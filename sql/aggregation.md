## Return news articles with related tags

Imagine a database where articles and their tags are separated into different tables. A developer wants to return one row per each article with all associated tags. The following query achieves this result:

```SQL
SELECT
      a.articleId
    , title
    , STRING_AGG(tag, ',') AS tags
FROM dbo.Article AS a
    LEFT OUTER JOIN dbo.ArticleTag AS t
        ON a.ArticleId = t.ArticleId
GROUP BY a.articleId, title;
GO
```

Here's the result set.

| articleId | title                                      | tags                        |
| --------- | ------------------------------------------ | --------------------------- |
| 172       | Polls indicate close election results      | politics,polls,city council |
| 176       | New highway expected to reduce congestion  | NULL                        |
| 177       | Dogs continue to be more popular than cats | polls,animals               |
