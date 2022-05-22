---
title: "Options"
date: 2022-05-22T16:00:00+01:00
type: docs
weight: 114
description: These options affect the behaviour of a view
tags:
- Architect
---
## Group by all non-aggregate fields
Affects how some calculation aggregates worked - documented in [calculations -> aggregates of child rows]({{<relref "/docs/views/calculations/examples#aggregates-of-child-rows">}})

## Allow exports
See [Security And Compliance -> Exporting]({{<relref "/docs/security-and-compliance/security-features/exporting">}})

## Record limit
Only return the top N rows of data from the view, even if there are more available. This is equivalent to adding a [LIMIT clause](https://www.postgresql.org/docs/current/sql-select.html#SQL-LIMIT) in SQL.

## Distinct fields
If many rows in the view have the same values for a particular field, then reduce the number shown to only one row for every distinct (unique) value of that field. The top row is returned.

Multiple distinct fields can be added, in which case the rows reduce based on their values unique in combination.

For example, imagine you have a view showing countries, cities and populations, sorted by population descending, with data like:
* Japan, Tokyo, 13,515,271
* Japan, Nagoya, 2,283,289
* UK, London, 8,908,081
* UK, Bristol, 463,400

Adding a distinct field on the country would reduce this to the most populated city in each country, i.e.
* Japan, Tokyo, 13,515,271
* UK, London, 8,908,081

DISTINCT is an [SQL feature](https://www.postgresql.org/docs/current/sql-select.html#SQL-DISTINCT)

## Amalgamate with
If you have two views with fields of the same type in the same order, then you can merge them together into one. The field names don't necessarily need to be the same.

This is done using an [SQL UNION](https://www.sqltutorial.org/sql-union/) clause.

## Cache view rows
Caching can speed up views. It doesn't need to be used often as the underlying database PostgreSQL is great at dealing with large data problems, but when it is necessary it can significantly speed up access, allowing faster loading and searching. Caching works well when
* a view is complex and slow to load
* it doesn't contain a massive number of rows - in this case the issue is likely to be the raw volume of data, rather than the complexity of calculations

If both those criteria are met, then turning on caching can significantly speed a view up, allowing faster loading and searching. There are three options
* no caching (the default)
* cache view, update on record save
    - this means when a view is opened or searched, if there have been changes to data in any tables used by the view since it was last opened, then the cache will be updated
* cache view, update once a day
    - useful for views that don't need to be updated often, e.g. monthly reporting figures

> If a view is cached and other views reference it, those other views will also speed up too.

Caching is implemented using [materialized views](https://en.wikipedia.org/wiki/Materialized_view).

> If you find a view is slow, feel free to [contact us](https://agilechilli.com/contact-us/) for support before trying options like caching, there are many other targeted options we can look at first, such as adding indexes.
