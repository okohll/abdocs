---
title: "Types of Join"
date: 2020-05-15T16:40:00+01:00
type: docs
weight: 90
description: Left outer, inner and cross joins
tags:
- Architect
---
Here's a Youtube video explaining the concept of joins and running through the various types.

{{< youtube 9yeOJ0ZMUYw >}}

Just remember, when using third party resources to learn about joins (or other SQL features), you don't need to write the SQL code in Agilebase, it's generated for you behind the scenes.

## Left outer and inner joins
The left outer join is the default type used when a join is added to a view in Agilebase. It suits most cases, but can be changed after join creation if needed.

A left outer join type will ensure that every row from the left source (table or view) is visible in output, whether or not the data links to a row on the right side. Conversely, when an inner join's used, data from the left will be hidden unless it links to data on the right.

That may sound rather abstract: working with an example, we can see what it means in practice.

Let's take the common and straightforward example of linking contacts to organisations. We start by creating a view from the contacts table, so that's on the left side. We then join from contacts to an organisations table, on the right. This join looks as follows:

![example join](/example-join.png)

That gives us a view where we can add fields from the organisation table into the view of contacts data. The output may look something like this:

![contacts view](/view-contacts.png)

Each row representing a contact, has the contact details (name, email address etc.) and from the organisations table, you can see the name and website of the organisation they belong to.

But wait a minute, what's that contact with blank spaces for the organisation name and website? That represents a **contact which is not yet linked to an organisation**.

I guess to be nit-picky, it could represent a contact joined to an organisation without a name or website address added, but here we'll assume all organisations have those details filled in.

When the join type is **left outer**, then this row will be shown, as seen. However, if it's changed to an **inner** join, then it will be hidden.

That's why left outer is the safest type to use by default. Otherwise with an inner, if a user adds a new contact, fills in all their basic details but doesn't link her or him to an organisation (perhaps they don't know the organisation or it doesn't exist in the system yet), then they won't be able to see that contact in the view. And if they can't see it, then they can't click on it to load it - it will have vanished for good (well, until the join is changed back to a left outer).

Sometimes of course, inner joins are very useful - but it makes sense that there must be a conscious decision to change a join to that type.

## Right outer and full outer
You may think, if there's a left outer, is there also a right outer? There is, it means all data from the right side is always visible, whether or not there's a match on the left. So in our contacts/organisations example, all organisations would be visible, whether or not any contacts belonged to them.

Practically, this isn't used much, as a right outer join is just the same as a left outer join started from the other table. There's no difference in the data visible, but using a left outer works better in Agilebase because you can be guaranteed that clicking on a row will load a record (with a right outer, if there's no data on the left side, then no record can be loaded when the row's clicked).

You may also hear of a full outer join - this again has a very small number of useful cases, but you can [read about them online](https://stackoverflow.com/questions/2094793/when-is-a-good-situation-to-use-a-full-outer-join) if interested.

## Venn diagram
Joins are often represented visually with Venn diagrams. Here's one, showing that for a left outer join, all the data from the left side is visible, whether or not a matching row exists on the right, and for an inner join, data from the left is excluded without a match. The results of right outer and full outer are also visualised.

![Joins Venn diagram](/joins-venn.png)

## Cross join
There's one final type to consider that can be used in Agilebase. Strictly speaking, it isn't a join at all, but it does bring together data from left and right sides in a particular way, so we'll think of it as a join here and it's treated as such in Agilebase.

If you have a mathematical background, it may help to know that it produces a cartesian product, or cross product, of all rows in the left and right sides.

However if you don't, not to worry, it can be easily explained without maths. Basically, every combination of each row on the left with each row on the right is output. So if you have three rows, A, B and C on the left and another three X, Y and Z on the right, then you would get as output: data from
* Row A with row X
* Row A with row Y
* Row A with row Z
* Row B with row X
* Row B with row Y
* Row B with row Z
* Row C with row X
* Row C with row Y
* Row C with row Z

> You can see that you need to be careful when creating cross joins that results won't balloon up into massive numbers of rows that are hard to deal with. For example, if two tables, each with a hundred thousand rows in, are joined by cross join, then 100,000 x 100,000 = 10,000,000,000 (ten billion) rows would output.

Once again, potential uses may be most easily explained by a real world example.

Cross joins can be used when reporting, to find data that's **not** there (to get a bit Zen). For example, say we have two tables
* customers
* products

We may want to create output representing the combination of every customer with every product - we could then further join this to sales data to find which products a customer isn't buying, or which products are being bought by most and fewest customers.

Firstly, we need all combinations. Create a cross join between customers and products, in a 'customer products' view.

The next step is similar to our reporting example of [joining on multiple fields]({{<relref "../joins#joining-on-multiple-fields">}}). Create a calculation 'customer product' which concatenates together customer ID and product ID. Create the same calculation in a view of sales (each sale of a product to a customer). Then join this sales view into our customer products view and bingo, we can display the total sales, whether zero or more, of each product to each customer.

> If you haven't yet read up on [calculations]({{<relref "/docs/views/calculations">}}), you may need to do that in order to accomplish everything above

### Adding a cross join
Adding a cross join is a little different to [adding a normal join]({{<relref "../joins#adding-a-join">}}). The left and right fields don't matter (as we want to apply any exclusion rules, we just want every combination of rows possible).

So follow the [normal process for a complex join]({{<relref "../joins#complex-joins">}}), but just select the left and right tables (or views), leave the fields at their default values.