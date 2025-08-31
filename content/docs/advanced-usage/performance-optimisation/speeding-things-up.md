---
title: "Speeding Things Up"
date: 2025-08-31T14:00:00+01:00
type: docs
weight: 132
description: There are a number of ways that view performance can be optimised
tags:
- Software Architect
- v6
---
Once you've [identified]({{<relref "examining-performance">}}) which views might be performance hogs, what can you do about it?

There are a number of options to look at.

Firstly, if a view is really slow you might want to temporarily speed it up with a quick fix to allow you to work on it.
One way to do that can be to add a filter to the view to make it not show any data.
That can be done with a filter on the row ID such as
* row id = 0

Once you've tried out some of the below you can then remove that filter to get the data back.

## Show only the data necessary
The simplest starting point is to ensure that only the data necessary for the intended task is included in the view. That goes for both roles and columns.

So for example, with a list of opportunities for salespeople to work, you probably only need the live enquiries, not the closed ones. If you do want a view of all historical records, you can of course create a second one for that purpose.
Also, limit the fields displayed to only those which are necessary.

## Look at joined views
The same thing goes for the joined views. If for example you have a joined view which calculates the distance in miles or km to each company in the above opportunities list above, ensure that view itself only calculates data for the live opportinities.

There's a bit of a trade-off with practicality here sometimes. You may have a view of distances to different companies which serves lots of different other views, so may not want to create a different one for each list the data's used in..
However for particularly problematic views you may want to consider it.

### Refactoring joins
A view might have lots of different calculations in it, pulling data in from many different sources.

It can help to rationalise this, splitting up one big view into simpler sub-views and joining to them. Caching those sub-views (see below) often helps.

Then from your main view, remove the calculations and any joins no longer necessary. Just join to the new simple views you've created.

As an example, imagine a view which calculates invoice totals for all historic invoices, along with additional customer information. The invoice totals could be separated into a separate view, cached, then joined to from the main view.

Ensure that each view only has the data necessary. For example, you might only need the past year's worth of invoices, not a complete history.

## Caching

For a complete discussion of what caching is and when it works, please see the [cache view rows]({{<relref "/docs/views/options/behaviour-options#cache-view-rows">}}) option.

## Query plan selection

Agilebase will automatically compare different plans and suggest the best one, but that can change over time. To verify or experiment yourself, use the [query plan]({{<relref "/docs/views/options/behaviour-options#query-plan">}}) option.

## Adding indexes

This is something we will need to do for you, but if you have filtered a view down to the minimum number of rows and it hasn't speeded up, it may help. Please [contact us](https://agilechilli.com/contact-us/).

For really big data projects, there's also the option of utilising PostgreSQL-compatible database services designed for such tasks, like [Citus Data](https://www.citusdata.com/), which we will be happy to provision.

