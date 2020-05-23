---
title: "Calculation Examples"
date: 2020-05-19T16:40:00+01:00
type: docs
weight: 90
description: Some examples of useful calculations for each type of field (text, number etc.)
---
The database which underpins agileBase is [PostgreSQL](https://www.postgresql.org) - 'The World's Most Advanced Open Source Relational Database'.

This page will just be an introduction to some of the things you can do with calculations.

A comprehensive definition and reference for all of the functions possible can be found here: https://www.postgresql.org/docs/current/functions.html

## Example functions for each type of field
Here are some 'starters for 10' that may be useful day to day.

### General functions
There are a couple of functions that are particularly useful to know about, to keep in your calculations toolkit. These are

#### Coalesce
The coalesce function lets you deal sensibly with empty values, which we call 'null' values. Normally, if any field you reference is null, then the result of the calculation is also null. Coalesce is a way to provide a default value. So for example, if a view of customer order lines has a quantity and a price field, but the quantity may be blank, then

`coalesce({quantity}, 0) * {price}`

would calculate the line value, outputting zero if the quantity is not filled in.

> Coalesce can be used with more than two arguments - the first non-null value it encounters, from left to right, will be output to be used in further calculation steps

#### Case
A case statement can be used to add 'if/then/else' logic. An example is
```
case
  when {due date} is null then 'unknown'
  when {due date} < now() then 'overdue'
  when {due date} < now() + interval '7 days' then 'due soon'
  else 'not due yet'
end
```

(We'll cover date calculations more below).

### Number functions
Common mathematical functions can be found here: https://www.postgresql.org/docs/current/functions-math.html

### Text functions
`{field 1} || ' ' || {field 2}`

* Two vertical bars are used to join bits of text together (this seems an odd choice to use rather than something like an ampersand or + sign, but there you go, that's what it is). A literal piece of text is surrounded by single quotes.

`substring({text field} FROM 1 FOR 1)`

* Extracts the first letter (or other character e.g. number) from some text.

`regexp_replace({full name}, '\\s.*', '')`

* A simplistic way of extracting a person's first name from a full name - strip out everything from the first space onwards.

This one is slightly more complex because it uses a powerful text matching/search and replace facility called **regular expressions**, or regexes for short. Again, this is a standard facility and there's lots of documentation available on the [PostgreSQL website](https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP) and elsewhere if you'd like to learn more.

> The only difference from standard to be aware of is that when entering a regex into a calculation in agileBase, you must use two backslashes instead of one.

### Date functions
The database has very strong support for working with dates and time - you can do many calculations on them. Here are a few examples.

`{date field} + '1 year'::interval`

* adds a year on to the given date

> You can do the same with months, week, days etc. and combinations like '1 week 1 day'

`date_part('year', {date field})`

`date_part('dow', {date field})`

* These two extract different parts of the date - the first just the year, the second the day of the week as a number 0 - 6. More info is available in the [PostgreSQL documentation](https://www.postgresql.org/docs/current/static/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT")

`date_part('days', ((date_trunc('month', now()) + '1 month'::interval) - now()))`

* Works out how many days are left in the current month. This example introduces a couple more date functions:
    * `now()` gives the current date and time
    * `date_trunc` 'truncates' a date to the month in this case (in other words rounding it down to the nearest month)

`to_char('19 May 2020'::timestamp, 'Day')` - outputs 'Tuesday'

`to_char('19 May 2020'::timestamp, 'Mon yyyy')` - outputs 'May 2020'

* [to_char](https://www.postgresql.org/docs/current/functions-formatting.html) formats a date (it also works with numbers)

`date_part('weeks',{date field 1} - {date field 2})`

* Counts the number of weeks between two dates

## Aggregate calculations
All of the examples above work within one row, or record, of data. Aggregate calculations are different, the take many rows of data and condense them down into one result - one number, or piece of text, etc.

They're very useful for creating summaries of data, such as total sales per product, counts of complaints per month per category, total value of an order (summing individual order lines) etc.

### Aggregates of child rows
To make an aggregate you have to have something to summarise by and something to aggregate. The easiest way of doing this is to create a view with a [join down]({{<relref "/docs/views/joins#upwards-and-downwards-joins">}}) from a parent table to a child. You can then summarise, or group by each parent row and aggregate one (or more) of the fields in the child table.

For example, if we have an invoices table and an invoice lines table, assuming there is a relation linking each invoice line to its parent invoice:
1. [create a view]({{<relref "/docs/views/creating-a-view">}}) from the invoices table - we'll call it 'invoice totals'
2. [add a join]({{<relref "/docs/views/joins">}}) down to invoice lines
3. Add the calculation `sum({line total})` to the view

You should then have a view with just one row per invoice line, showing the invoice total. **sum** is an example of an aggregate calculation. Another common example is **count**. If you replaced `sum({line total})` with `count(*)`, that would count the number of invoice lines in the invoice, instead of totalling the values up.

> Note - the aggregate calculation groups by all non-aggregate fields in a view. For example, if you added the product name into ou invoice totals view, you'd get a total per product per invoice, rather than a total for each whole invoice.

### Aggregates without child rows
There's another way to create aggregates, which can be used without joining down to a child table or view.

1. In the tiles interface, open the view you wish to edit
2. Click your user icon at the top right and select _admin - edit view_ from the menu
3. Tick _Group by all non-aggregate fields_
4. Add any fields you wish to group by to the view. Remove any you don't wish to group by **including any hidden fields** such as the IDs of joined tables
5. Add the aggregate calculation e.g. `sum({my field})`

### Expanding rows
Some functions do the opposite of an aggregate function - rather than condensing and summarising many rows into one, they split one row up into many. For example, if one of your fields is a comma separated list, you could split that up into many rows, one per item in the list.

Say for example you import data from a form on a website which produces a comma separated list of products ordered.

Adding the calculation

`regexp_split_to_table({products ordered}, ',')`

would produce one output row per product in the list. That could then be joined to other data in the system such as pricing.

### Window functions
Window functions are somewhat like aggregate functions in that they can act on many rows, not just one. However, they don't condense down into a single row. An example would be calculating a rolling average or cumulative total as each row is shown.

Effectively, they look at a 'window', also called a partition, of rows around the current row and calculate a result based on those. That could be for example
* the current row, the one before and the one after it
* every row up to the current row
* every row
* every row which is similar in some way e.g. has the same value for a 'category' field
* etc.

As an example,

`{price} - avg({price}) over (partition by {category})`

would calculate for each item, the difference from the average price of items with the same category.

This again is much too large a topic to cover in an introductory page, there's plenty of documentation here: https://www.postgresql.org/docs/current/tutorial-window.html
 and a video introduction to the concept here:

 {{< youtube blHEnrYwySE >}}

### Series generation
Sometimes you need to **generate** a set of rows, as opposed to having the data stored in the database. Here are some quick examples:

`generate_series(1,10)`

* generates the numbers 1 to 10, each one in a different row

`generate_series(now() - '10 years'::interval, now(), '1 month'::interval)`

* generates one row per month, from 10 years ago up until this month

## Summary
The functions above highlight just a few of the many possibilities. Please feel free to read up on PostgreSQL some more and if you come up with any neat calculations yourself in your everyday work, please do send them to support@agilebase.co.uk and we'll add them to this page.


