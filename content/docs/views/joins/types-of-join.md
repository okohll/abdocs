---
title: "Types of Join"
date: 2020-05-15T16:40:00+01:00
type: docs
weight: 90
description: Left outer, inner and cross joins
---
Here's a youtube video explaining the concept of joins and running through the various types.

{{< youtube 9yeOJ0ZMUYw >}}

Just rememer, when using third party resources to learn about joins (or other SQL features), you don't need to write the SQL code in agileBase, it's generated for you behind the scenes.

## Left outer and inner joins
The left outer join is the default type used when a join is added to a view in agileBase. It suits most cases, but can be changed after join creation if needed.

A left outer join type will ensure that every row from the left source (table or view) is visible in output, whether or not the data links to a row on the right side. Conversely, when an inner join's used, data from the left will be hidden unless it links to data on the right.

That may sound rather abstract: working with an example, we can see what it means in practice.

Let's take the common and straightforward example of linking contacts to organisations. We start by creating a view from the contacts table, so that's on the left side. We then join from contacts to an organisations table, on the right. This join looks as follows:

![example join](/example-join.png)

That gives us a view where we can add fields from the organisation table into the view of contacts data. The output may look something like this:

** TODO: screenshot **

Each row representing a contact, has the contact details (name, email address etc.) and from the organisations table, you can see the name and website of the organisation they belong to.

But wait a minute, what's that contact with blank spaces for the organisation name and website? That represents a **contact which is not yet linked to an organisation**.

I guess to be nit-picky, it could represent a contact joined to an organisation without a name or website address added, but here we'll assume all organisations have those details filled in.

When the join type is **left outer**, then this row will be shown, as seen. However, if it's changed to an **inner** join, then it will be hidden.

That's why left outer is the safest type to use by default. Otherwise with an inner, if a user adds a new contact, fills in all their basic details but doesn't link her or him to an organisation (perhaps they don't know the organisation or it doesn't exist in the system yet), then they won't be able to see that contact in the view. And if they can't see it, then they can't click on it to load it - it will have vanished for good (well, until the join is changed back to a left outer).

Sometimes of course, inner joins are very useful - but it makes sense that there must be a conscious decision to change a join to that type.

## Right outer and full outer
You may think, if there's a left outer, is there also a right outer? There is, it means all data from the right side is always visible, whether or not there's a match on the left. So in our contacts/organisations example, all organisations would be visible, whether or not any contacts belonged to them.

Practically, this isn't used much, as a right outer join is just the same as a left outer join started from the other table. There's no difference in the data visible, but using a left outer works better in agileBase because you can be guaranteed that clicking on a row will load a record (with a right outer, if there's no data on the left side, then no record can be loaded when the row's clicked).

You may also hear of a full outer join - this again has a very small number of useful cases, but you can [read about them online](https://stackoverflow.com/questions/2094793/when-is-a-good-situation-to-use-a-full-outer-join) if interested.

## Venn diagram
Joins are often represented visually with Venn diagrams. Here's a left outer join visualisation, showing all the data from the left side is visible, whether or not a matching row exists on the right, and an inner join diagram showing that data from the left is excluded without a match.

![Joins Venn diagram](/joins-venn.png)

