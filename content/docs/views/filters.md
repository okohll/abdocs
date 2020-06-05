---
title: "Filters"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 90
description: Adding filters to a view
---
Filters can be applied permanently to a view, allowing an administrator to specify the subset of records that should be displayed. This is often for convenience and to create more useful systems. For example, if you have a database of suppliers, you may want to create views showing those which are approved, those which aren't, those which are local etc. Each view would have a different set of filters applied.

> Remember people can apply additional 'ad-hoc' or temporary filters to a view at any time using the filter boxes at the top of the screen, so it may not be necessary to create filtered views for every eventuality.

A filter can act on any field or calculation in the view, as well as on any in joined tables or views.

Multiple filters act like they have AND between them, i.e. they are applied additively. If you wish to apply a filters with OR between them, or if you wish to apply a filter on the reult of the comparison of fields, then simply create the relevant [calculation]({{<relref "calculations">}}). For example, if you added two filters to a suppliers view

**status equals approved** and **status equals pending**

then you would get no records showing - a status can't be both one thing and another. However if you created a boolean calculation 'pending or approved', with definition

`{status} like 'approved' or {status} like 'pending'`

you could then add a filter on that calculation

**pending or approved equals true**

## Adding a filter
1) In the tiles interface, load the view you wish to edit
2) Click your user profile icon at the top right and select _admin - edit view_
3) Under _Filters_, click the _Add Filter_ button
4) Choose relevant options and press _Add_

There are 26 types of filter to choose from, from the simple 'equals' and 'not equal to', to more complex pattern matching using [regular expressions](https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP).

Some filters apply to multiple data types, others only to specific types. For example, 'newer than X days ago' only applies to date fields.

Once you've added a filter, you'll be able to type in a description for it. If no description is entered, the system will automatically generate one, which you'll be able to see.

This description is shown to users as help in particular circumstances, e.g. when the view is used as a [chaser]({{<relref "/docs/workflows/send-chaser">}}), so it's a good idea to check it makes sense.

