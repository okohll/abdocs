---
title: "Behaviour Options"
date: 2022-05-22T16:00:00+01:00
type: docs
weight: 114
description: These options affect the behaviour of a view
tags:
- Citizen Developer level 3
- v6
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
Caching can speed up views. It works well when
* a view is complex and slow to load
* it doesn't contain a massive number of rows - in this case the issue is likely to be the raw volume of data, rather than the complexity of calculations

If both those criteria are met, then turning on caching can significantly speed a view up, allowing faster loading and searching. The options are
* no caching (the default)
* cache view, update when data changes
    - this means when a view is opened or searched, if there have been changes to data in any tables used by the view since it was last opened, then the cache will be updated
* update every 10 minutes or hourly
* update once a day
    - useful for views that don't need to be updated often, e.g. monthly reporting figures

It's best to choose the longest time you can get away with as the cache will need to be refreshed less frequently, reducing the load on the server and speeding things up the most.
However sometimes you may need data to be absolutely up to date, in which case the 'update when data changes' option is necessary.

### Speeding up *other* views

If a view is cached and other views reference (are joined to) it, those other views will also speed up too.

For example, say you have a top level view 'monthly invoicing', which shows the total invoice amount per customer per month.

To allow it to work, it joins to another view 'invoice amuounts', which per invoice, adds up all the invoice line values.

Now, absent of any caching, the *monthly invoicing* view would need to do all the work of *invoice amounts* every time it was viewed, as well as its own work of totaling per month per customer.

If the view *invoice totals* were cached, *monthly invoicing* be able to just 'look up' the total of each invoice from the cache, potentially speeding things up significantly.

The advantage of caching the lower level *invoice totals* view rather than the top level view is that it's not unlikely that *invoice totals* is referenced by other views as well - so you get more bang from your buck by caching it, you potentially speed up lots of views in one go.

### Things to watch out for

#### The cache is updated too often
Sometimes views may need to be always up to date when viewing them and also update so often that the cache would need to be refreshed almost every time the view was looked at.
In that case, there's no benefit to caching and to speed it up, you'd need to look at [other methods]({{<relref "/docs/advanced-usage/performance-optimisation" />}}).

#### The system can't detect when a cache update is necessary.
In some cases, the system might not be able to properly detect every time the cache needs to be updated. To explain this, we'll need to look at how the caching works:

Every time someone edits (adds, updates or deletes) a record in Agilebase, it performs a check to see which views might be affected.
Not every view may be - for example if the change is to a field which doesn't appear in a view and which isn't used in a filter, then it can be guaranteed not to affect it.
If any of those views are cached, a cache refresh is triggered, either for some specific time in the future, or when the view is next read (depending on the caching option selected).

However, not all changes to a view might be detectable. For example, if a view has a filter on 'creation time is older than 10 minutes ago', then the contents of the view will change 10 minutes after the creation time of the oldest record in it, whether or not any actual data in the database changes.

To help mitigate that, such views are detected and *any* change to data in joined tables will trigger a refresh, regardless of whether the change could affect the view. However that still doesn't help if there aren't any data changes at all.

For views like that, a warning is shown on screen when you enable caching. It doesn't mean that you can't cache it necessarily, just that you should be aware of the risk that it might not *always* be updated in a timely manner.

> Note: 24 hour workflows are excluded from this concern, they're always guaranteed to run once a day

### Technical details

Caching is implemented using [materialized views](https://en.wikipedia.org/wiki/Materialized_view).

## Query Plan

The majority of the time you will not need to change this setting. However here's what it does in case you do:

When getting data from a view (the list of rows), the database internally uses a [query planner](https://www.postgresql.org/docs/current/planner-optimizer.html). The planner works out the quickest way to return the results, as for complex queries there may be many possible ways.

Most of the time that works very well, in fact increasingly well with each new release of the PostgreSQL database. However sometimes a sub-optimal plan can be used, resulting in a slow view. Agilebase then automatically tries out an alternative (specifically, disabling the use of '[nested loops](https://www.postgresql.org/docs/14/runtime-config-query.html') to see if that's faster and sets this option if so.

This option only needs to be changed if the Agilebase detection fails (which is possible, query timing can depend on many factors, such as how many other queries the database is running at the time), resulting in a slower view rather than a faster one.

In that case, you can experiment by changing the setting from 'default' to 'alternative' or vice versa.

As above, feel free to [contact us](https://agilechilli.com/contact-us/) if you have any questions about improving database performance.