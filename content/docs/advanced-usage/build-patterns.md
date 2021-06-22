---
title: "Build Patterns"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 130
description: Common patterns, or recipes for accomplishing useful tasks
tags:
- Pricipal Architect
---
Some of these are just useful ideas, some are tips and tricks and some are larger-scale build patterns for more complex tasks commonly undertaken by customers.

These tips will link to various other places in the documentation, but it will still be useful to have some experience of building in agileBase before reading.

## Settings table idea
To use a single store of a common setting throughout the application. When a setting is changed it will then automatically take effect throught the whole application.

> Example: VAT rate

## Snapshots idea
Taking snapshots of a set of rows from a table at a point in time allows a comparison of earlier snapshots with later ones, or the current state, to show differences.

> Example: delivery van loading reports. An initial snapshot of tomorrow’s orders shows what product quantities to load onto the vans. Later snapshots, taken at any point, will show any additions/removals needed at that time, by subtracting the current order lines from previous ones.

## Gap filling in monthly (or other period) reporting
When reporting monthly figures in a view (e.g. quantities sold per product per month), if there may be some gaps, they can be filled with zeros.

In outline, the solution is to 
1. Create a table containing one and only one record. Once a record has been created, disallow adding or removing records using [table options]({{<relref "/docs/tables/options">}}).
2. From that table create a view called e.g. 'month series'
3. Add a [`generate_series`]({{<relref "/docs/views/calculations/examples#series-generation">}}) calculation to that view to generate the list of months required.

A report can then be created by joining from 'month series' to the actual data you want to report. You may need to join on a calculation, e.g. a text representation of the month (using the [`to_char`]({{<relref "/docs/views/calculations/examples#date-functions">}}) function) or an amalgamation of a month and product code.

## Joining on compound keys
Extending the above, what about when you want to summarise by two factors, e.g. ‘by customer by product’. In that case create calculations to make a unique key per combination e.g. 

`{customers.id:customers} || ‘_’ || {products.id:products}`

Use the same calculation in views you want to join to and join on it.

This is much better than the 'naive' idea of creating separate joins to each table, which won’t work.

## Including multiple aggregates from different sources
Joining from one table down to multiple child tables in order to perform aggregates will not work - you'll experience double counting.

For example, if a customers table joins down to both 'customer invoices' and 'customer complaints', then a `count(*)` calculation will return neither the number of invoices or complaints, but the product of the two i.e. the number of invoices times the number of complaints.

To solve this,
1. Create one view dedicated to each aggregate calculation, created from the parent table. The view will then have one row per parent record i.e. customer in this case
2. From a final view created from the parent table, join to these views in order to include the results

## Calculating the number of weekdays or weekends between two dates
1. Generate a series of all the dates between two dates, calculate the day of the week for each
2. From a separate view, join to this series and count up all the cases where it's not a weekend

> This is necessary as calculations on the results of a generate_series often need to be done from a separate view

## Outputting a ‘pivoted’ view in a printout
In a template, `$view.htmlTable(“table name”, “view name”)` outputs the contents of the view.

Use `$view.htmlTableTransverse(“table name”, “view name”)` instead for a pivoted version with columns and rows swapped.

## Capturing dates of status changes on lookup list
Show a date field only when the dropdown reaches the desired status, using [field options]({{<relref "/docs/fields/field-options/common-options#show-if-record-in-view">}}). Use a [referenced data field]({{<relref "/docs/fields/field-options/common-options#set-from-previous-referenced-field">}}) to populate it with the current time.

## Record Builder 
Scenario: A customer tends to order the same products every time. Have an option for the system to auto fill the “standard” order every time an order is placed.

Use the tab option [Populate from template]({{<relref "/docs/tables/hierarchy-navigation/tabs#populate-from-template">}}).

## De-duplicating a comma separated list
Calculation template:

```
array_to_string(
  array(select distinct unnest(
    regexp_split_to_array(‘my,comma,separated,list’, ',')
  ))
,',')
```

Example:

```
array_to_string(
  array(select distinct unnest(
    regexp_split_to_array(
      string_agg({b2.2) ingredient suppliers.ingredient supplier's countries of origin}, ',')
    ,',')
  ))
,',')
```

## Custom filtering when choosing a relation
When choosing a relation, either in a [junction table]({{<relref "/docs/tables/relational-database-concepts">}}) or otherwise, the system will automatically filter on the ID of any related parent record. For example, when adding order lines to a customer order, if each product is related to a customer, then the system will automatically only let the user choose products for that customer.

However it won’t filter on anything that’s more than one direct relationship away. If you want to do that, or indeed filter on anything else at all, you can create a filter calculation.

1. In the relation chooser view, create a calculation e.g. ‘my relation filter’ and set it to contain the contents of what you want to filter on e.g. some other field. The calculation can be hidden.
2. From the main table, create a new view. In that view, create a calculation with the same name and contents.
3. Add that a cross-reference field into the main table, utilising that view. In the field options, tick [_use as filter_]

## Switching a field from one type to another
For example, converting a whole number field into a decimal number
1. Rename the field to '{fieldname} old'
2. Add a new field '{fieldname}'. This means that any calcs updated won't have to be changed and won't break due to mis-matching field names
3. Copy all values from one field to another. The easiest way to do that is to use a [workflow]({{<relref "/docs/workflows">}})
4. Try to delete the old field. It will show a list of views that contain it
5. Edit all those views to remove references to the field and add the new field. That includes updating all calculations that reference the field to trigger the system to realise that the calc. no longer references eht old field
6. Remove the old field

## Finding the 'latest' child record
A common scenario occurs when you have a one to many relationship. You want a view which shows precise info from the 'latest' child record.

Start with parent table and join to child, add the controlling field and set the correct order. For example, sorting by 'created on [auto]' descending will give you the newest child record. Then go to _manage_ tab of the view and set the _Distinct Field_ option to the Parent table’s ID field.

You can now freely add what ever fields from the child record happy in the knowledge you’ll only have the one line per parent.





