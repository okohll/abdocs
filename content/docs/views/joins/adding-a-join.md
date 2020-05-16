---
title: "Adding a Join"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 80
description: Creating a join
---
agileBase will automatically pick out the common tables you may wish to join to, by seeing which are related via [relation fields]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}). Once you get used to the concepts, you may also wish sometimes to add joins manually to tables or views not automatically suggested. That will be covered at the end of this page.

## To add a join
1) In the tiles interface, load the view you wish to edit (add a join to)
2) Click your user profile icon at the top right and select _admin - edit view_
3) Under _Joins_, click the _Add Join_ button
4) A list of joins you can add will appear, each representing a link to a table with related data in it. Select one and the join will add

## The anatomy of a join
The added join will appear graphically above the _Add Join_ button. The lefthand 'blob' or part represents the table being joined from, on the right is the one joined to. In the middle is a selector for the [join type]({{<relref "types-of-join">}}), which we will come to.

In each part, left or right, the name of the table being joined from (on the left) or to (on the right) is shown in bold.

Underneath the table name, the name of the field used to match records is shown. When an ID field is shown, this just refers to the internal ID agileBase uses automatically to make the match. It's only of relevance if you're creating advanced joins manually - see below, so can be ignored otherwise.

![example join](/example-join.png)

In this example, we have a join from the **contacts** table to **companies**, to allow us to add company information into our view. The link was made based on the **organisation** field in the contacts table, which lets a company be assigned to a contact.

## Upwards and downwards joins
You may notice when clicking _Add Join_ and looking at the list of potential joins available, that some of them show as joining **up** and others **down**.

Joins up are from a 'child' to a 'parent', i.e. you can think of a contact as belonging to a organisation, so a join from contacts to organisations is an upwards join. The other way round, it would be a downwards join.

What difference does this make? Well if you join down, then the view will contain one row for every child record, with repetitions in the parent data if the parent is the same. This is easier to see with a picture - here's what a view from an organisations table looks like when it joins down to contacts - there are three contacts for the organisation TODO.

** TODO: screenshot **

However, joins down can be very useful when you want to aggregate child data, for example if you want to count the number of contacts each organisation has, you could add a join from organisations down to contacts, then add an [aggregate calculation](https://todo.com) to count the contacts. The system would then condense everything into one row per organisation, like so:

** TODO: screenshot **

So joins upwards are the more common case, but joins downward can be useful for particular purposes.