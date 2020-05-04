---
title: "Relational Database Concepts"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 20
description: Useful concepts to understand prior to building applications
---
Before diving into the details of building applications, starting with tables, let's take a step back and learn some background information about databases, including what a table is. If you're familiar with these concepts, feel free to skip this section.

When building back office software with agileBase, a large amount of what we'll be doing is building database structures, to store user-entered data. agileBase takes care of creating the user interface to allow users to use these structures automatically, e.g. to search for data, add and edit it.

You will find many articles explaining relational databases if you look for them on the internet. Most will introduce SQL, the language used to work with databases. It's not necessary to learn that as agileBase generates it automatically behind the scenes, but the higher level concepts are useful to grasp.

Here's a YouTube video with a good introduction.

{{< youtube NvrpuBAMddw >}}


If you prefer reading, here are a couple of examples.

## Simple example - what is a relation?
Imagine we want a place to store records of suppliers to our business. This could be the start of a supplier management system to compare companies based on quality, accreditation levels and price for example, or to carry out supplier approval processes.

To do this we need just one table 'suppliers' which would have fields in such as
* company name
* a few address fields
* phone number
* website

etc.

That's just like creating a spreadsheet with column headings across the top for those fields. You can then add a row for each supplier you record.

Now, if we communicate with our suppliers, we may want to store the contact details of a few key people at each supplier.

Typically, a naive spreadsheet user would add a few more columns (fields in database parlance), things like Contact Name 1, Phone 1, Email 1, Contact Name 2, Phone 2, Email 2. As you can imagine if there are more than one or two contacts, it would become pretty cumbersome and difficult to maintain.

With our database we can easily do a lot better and create a separate table of contacts that links to the suppliers table - in fact it **relates** to it. That's why relational databases are so called, just because they're very good at dealing with relations between tables.

So we have our contact table, maybe with fields
* Contact name
* Role
* Direct Line number
* Email address

etc.

To connect them we add another field of a special type, called a *relation*. It can be called Company, but rather than storing the company name again (we already have stored the company name in the suppliers table), it will be a link to a particular company. Don't worry about how that works behind the scenes, just know that the Company relation links to a supplier.

So now we have

** TODO: diagram **

We can now add as many contacts as we like to a supplier. And if we decide to store some more data about each contact, maybe a link to their LinkedIn profile for example, we can add that field to the contacts table and it will automatically be there for all contacts (as opposed to our naive spreadsheet example).

## A more complex example
That's a good start. Moving on, there's one more type of relation it's useful to understand - the 'many to many'.

Our link between contacts and suppliers above is called a 'one to many' (or sometimes many to one) relationship. The reason is simply that one supplier can have many contacts attached.

What happens if we think about a more complex case? Suppose our suppliers supply us with raw materials, for example ingredients and packaging. We may want to record which materials each supplier supplies.

We could set it up as above, where we have a raw materials table. A raw material has a relation field linking it to a supplier, so one supplier can supply many materials.

However, what happens if a particular raw material is supplied by more than one company? You may have a primary supplier, then various fallbacks for example.

We'd have to create a new raw material record for each supplier. That would be ok if our raw material record consisted of nothing more than a name and maybe a price, but there could be dozens or hundreds of fields added as we build up our system - to store nutritional information, chemical properties, allergens, etc. etc. That would mean lots of duplication to keep track of. And if we want to later build recipes which use our raw materials, we'd probably just want a recipe to refer to 'flour', not 'flour from Supplier X'.

The solution is to create a **many to many** relation, where one supplier can provide many raw materials but also a single raw material can be linked to many different suppliers.

There's no new field type to get to know, we just use the standard one to many relation we've already learned about in a clever new way - we use two of them, plus a join table. The structure looks like this:

**TODO: diagram of junction table**

The table in the middle, Links, is called a join table, or junction table.

It has a normal relation field linking it to suppliers, and also one linking to ingredients. By adding a record to the links table, we can join any ingredient to any supplier. A supplier can then have lots of ingredients, but an ingredient can also have lots of suppliers.

The video above also explains this type of relation if you've not already watched it.

### When to use the many to many
You may have a niggling thought at the back of your mind: how do I know whether it's best to use a simple one to many relation, or a more complex many to many setup? Surely I could use many to many for contacts and suppliers too? A single contact may be associated with more than one supplier, for example if they're a contractor, or if they move jobs.

The answer to that just comes down to your judgement. Although agileBase creates a friendly, easy to use interface on top of the data structure, the many to many does add complexity. So it's a bit of a trade-off. However the advantage of a no-code system like agileBase is that you can rapidly try out ideas and see which one works best. As time goes on you'll get a sense of what works best in which situation.

> If you do want to learn more about this topic, it's called 'database normalisation' and there's plenty written about it!

## Summary
I hope that gives you a bit of background about what a table is, what a relation is and how they work together.
* A table is a store of data about a single concept e.g. a company or contact
* A relation field links tables together e.g. a contact belongs to a company
* Many to many relations (created with a join table) are sometimes useful. They allow us to link many records of one table to many of another.

That's pretty much all of the most important information you'll need to know about data structures. The rest of the documentation will show you how to create applications practically. Have fun!










