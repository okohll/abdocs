---
title: "Tips and Tricks"
date: 2024-04-02T09:30:00+01:00
type: docs
weight: 115
description: Some interesting solutions for common problems encountered when building solutions in agileBase
tags:
- Software Architect
- v6
---
WInteresting solutions for customers will be described here.
## Manually Formatting a 2dp decimal as a Duration 
Numeric fields can be marked as “Use Duration” which will nicely display the field as a time - really useful for event start times etc.
However, sometimes you need to do the formatting yourself and it can be fiddly.
Use the following code to help…
~~~
    to_char( trunc ( {start time} ), ‘00’ )
    || ‘:’ ||
    trim(
    to_char( ( {start time} - trunc ( {start time} ) ) * 60, ‘00’)
    )
~~~

## Adding a carriage return to a calculated string - ‘\n’
A new line can be inserted by using the correct escape character so…
~~~
some text before || ‘\n’ ||some text after ==
~~~
(It may be simple, but I always end up looking this up on Postgres forums so thought it useful for this forum!)

## SQL to return the full name of the logged in User 
The inbuilt function abuserid() returns the user’s identity, which is great for setting dropdowns that are filled with users, but not so good when you don’t want their username (e.g. the sign off an email or in Doc gen).

Try using the following to get just the user’s full name
~~~
left(ab_userid(), position(‘(’ in ab_userid()) -2)
~~~

## Finding records without any child records 
A customer came up with an interesting question this morning - how to find records without any connected child records, in this case companies with no opportunities logged.

Here are a couple of ways of doing that which come to mind:

One would be

1. create a view from the companies table
2. add a join down to opportunities (it should be one of the suggested joins as there is a relationship between the two tables)
3. add a filter ‘id:opportunities is blank’

i.e. there is no opportunity found for the company.

Another way would be

1. create a view from the companies table
2. add a join down to opportunities, just like above
3. add a calculation which is count({id:opportunities}).
You should now see the number 0 next to any company which has no opportunities
4. add a filter on the calculation, i.e. ‘count = 0’

I’d suggest using the method which makes most sense, i.e. the easiest to understand logic.

## Ranking results with an increment value in a view 
The below statement is calculating the rank of each row within each partition, based on the descending order of the {price list lines.id:price list lines} column.
~~~
rank() over(
  partition by {pricelists - price lines.code and customer}
  order by
    {price list lines.id:price list lines} desc
)
~~~

We use this form of statement to highlight any duplicate values falling within our pricelists within our system. Anything with a value greater than 2 is a duplicate.

This statement could be applied to several cases, ranking best selling products for a customer or the highest weighted ingredient in a recipe.

## First day of last month 
Simples...
~~~
date_trunc(‘month’, now()) - interval ‘1 month’
~~~

## Random Password
Useful for creating a random password or code
~~~
substring(md5(random() :: text), 0, 7)
~~~
Using 7 gives you a 6 digit code!?!?





