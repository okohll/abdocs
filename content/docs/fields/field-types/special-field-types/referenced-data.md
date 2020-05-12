---
title: "Referenced data"
date: 2020-05-07T16:40:00+01:00
type: docs
weight: 90
description: Embed data or charts from elsewhere in the system into a form
---
Most fields in a table allow data entry into that table, but referenced data fields allow data from **other** places to be embedded, specifically [views](https://todo.com), created from any table. 

Optionally, the embedded data can be editable.

This can be used for many purposes, such as
* showing calculations, e.g. when editing a recipe, you may want to show the total cost/kg of all ingredients and packaging in that recipe
* embedding charts, e.g. in the record for a customer, you may want to show the last 12 months of sales data
* allowing quick editing of related data, e.g. after selecting a customer contact for a sales opportunity, allow quick editing of their contact details without having to navigate away from the opportunity record

Some more esoteric uses are also possible
* referenced data can be used as a source of data to populate standard fields in the form, i.e. to provide default values for fields - see [relation field options](https://todo.com) for more information
* a referenced data field can be displayed as a button to [manually run a workflow](https://todo.com)

## Adding a referenced field
Referenced fields are based on views. The contents of a view will be displayed in the form where a field referencing data from that view is added.

The way it works is that the chosen view must contain the ID field of the table the referenced field is added to. When displaying data, the view is filtered to only show records where the ID matches that of the record being edited.

Let's take the sales opportunity example from above. You wish to include details of a selected contact in an opportunity record.

First, create a view of contacts linked to each opportunity. It may have fields in it such as the following:

** TODO: screenshot of example data in spreadsheet **

> Note - ID fields aren't usually displayed to the user, they're shown here to make the explanation easier

When a field referencing this view is added to the opportunities table, the output may display like this, when editing a particular opportunity, e.g. number 4

** TODO: screenshot **

So to summarise, the steps are
1. [Create](https://todo.com) or find a view containing the data you wish to embed. It must contain the ID field of the table the data is embedded in (in this case 'opportunities').
2. [Add a field]({{<relref "/docs/fields#adding-a-field">}}) of type _referenced data_. Select the table your target view was created from, then the target view itself, before pressing _create field_

Actually, there is one case in which the rule that the view must contain the ID of the table the referenced data is being added to. That's when you want to show **all** rows from the view, without filtering.

> This is typically used in a minority of cases, but can be useful when you want to embed data that isn't related to the target table. For example, showing some global settings that may affect the functionality of a system.

## Showing one or more rows
If more than one row in the view has an ID matching the ID of the table being added to, all will be shown. There is limited space in a form, so if there are lots, then a 'see more' option will appear after the first few rows. For a more compact view, [tabular display](https://todo.com) can be chosen in the referenced field options.

## Showing charts
If the view used has one or more [charts](https://todo.com), they will be shown instead of the data rows. The filtering acts exactly the same way, only data matching the containing table's ID is used as the source of the chart data.

** TODO: screenshot of embedded chart **

## Making referenced data editable
Optionally, referenced data can be made editable by clicking on it.

A view containing the containing table's ID can be created one of two ways. 
1. Create a view from the containing table, [joining](https://todo.com) to other tables
2. Create a view from another table, joining it to the containing table

If a view is built the second way and embedded into the table via a referenced field, the data will be editable: clicking on an element of referenced data will turn it into a data entry form.

If it's built the first way, data will not be editable.

In an editable referenced field, only fields directly from the table made to create the view will be editable. Other fields will be read-only.


