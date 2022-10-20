---
title: "Relation Field Options"
date: 2020-05-12T16:40:00+01:00
type: docs
weight: 70
description: Options specific to relation fields, which determine how tables link together
tags:
- Architect
---
Relations between tables are the 'glue' that holds together an application built using Agilebase. If you'd like to learn more about this fundamental concept, please check out the [relational database concepts]({{<relref "/docs/tables/relational-database-concepts">}}) page.

Some of the options for a relation field determine the nature of the links between tables, which can have a great effect on how an app works, so it's very useful to know about them.

## One to one only
By default, a relation is a 'many to one'. For example if a relation field in a contacts table links to an organisation, that organisation can have many contacts linked. If an ingredient links to a recipe, that recipe can have many ingredients. One customer can have many orders - examples are numerous.

If a relation is marked as 'one to one only', then that behaviour is changed so that only one 'child' record of this type is allowed for a particular 'parent' record.

When is this useful?

Take the case of an ingredient record. You may want to record nutritional information, chemical composition and allergens for example. With each type of date stored in a separate table, linked by a one-to-one relation, these can be separated out on the screen into [tabs]({{<relref "/docs/tables/hierarchy-navigation/tabs">}}).

The advantages of doing that, as opposed to just adding all the fields into different blocks in a single table are
* The user interface becomes clearer to navigate, especially if you have dozens of fields in each section
* Different privileges can easily be assigned to different tables. For example, you may want only certain people to be able to update allergen information, with others able to view but not edit the data.

## Do not auto-populate
This is ticked by default. When un-ticked, this means that when you add a new record, the relation field will automatically be populated with a link to the last 'parent' item you were looking at. For example, if you edit an organisation, then move away somewhere else in the system, finally load a contacts screen and create a new contact, that contact will link to the organisation you were editing (assuming there's a relation field linking contacts and organisations).

> A [similarly named option]({{<relref "sequence-field-options">}}) exists for sequence fields, to prevent auto-population of sequence numbers

## On parent delete
This is an important option for controlling what happens when a parent record is deleted.

Let's assume we have a table of customers and one of invoices, each invoice linked to a customer by a relation field in the invoices table, so the invoice is a 'child record' of the customer. What would happen if a customer is deleted? This setting controls that and there are three options.
* disallow deletion (the default)
    - the user is prevented from deleting the parent record. They have to manually delete the child record before being allowed to delete the parent.  
> This is the safest option and the default
* cascade delete
    - the user is allowed to delete the parent and when the parent is deleted, **child records are deleted as well**. The user is still shown a prompt asking if they're sure they want to do this.
* make orphan
    - when the parent is deleted, the child record is retained, but un-linked from the parent. In our invoice/customer example, we would be left with an invoice not linked to any particular customer

> Note that this option is set on the *child* relation field, not on the parent side. Therefore you can have different rules for different child tables. A good practice is to set this to *disallow deletion* for any important information in the system, that you wouldn't want to be lost (like invoices) and for other tables choose one of the other options appropriately.

## Value to display
The field from the parent table that easily identified the record, to show in the child editing form. For example, for the 'company' relation field in a contacts table, you might select 'company name'.

## Secondary value to display
For additional context, a secondary identifying field from the parent record can be chosen. For example, as well as the name of a company, you may want to show the city or country they're in.

This field doesn't have to be directly from the parent table, it can also be any field in the **view to use** selected (the below option), including a calculation, which opens up more display possibilities, e.g. concatenating the values from multiple fields together.

## View to use
When the user is selecting a parent record to link to a particular child, they will be able to use this view to show a list of parent records to choose from. Therefore the view must be created from the parent table.

They will be able to filter on any field in the view to search for a record.

> Using pre-set [view filters]({{<relref "/docs/views/filters">}}) to narrow down the list of relevant records can be helpful, e.g. if only records of a certain category are required.

## Use only given values
When this is un-ticked, allow the user to create a new parent record directly from the child record's editing screen. Relation fields allow you to type the name of a parent record to find and select one. If no matches are found, a prompt will appear allowing the user to create one.

## Show navigation link
When this is ticked (as it is by default), allow the user to navigate from a record containing this field to the one that the relation links to. For example, if a contacts table contains a relation to the organisations table, then when a user views a contact, allow them to navigate to the related organisation by clicking a navigation icon next to the field.