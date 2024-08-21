---
title: "Altering Data"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 120
description: Workflows can be used to alter data within the system
tags:
- Junior Software Architect
---

The following workflow types alter data within the system
1) Create record - This will create a new item in the nominated table
2) Update record - This will alter the values of the record.
3) Lock record - This will apply a record level lock on the item.
4) Delete record - This will totally remove the record.
> Deleting records is not reversible. Please use with caution.

## Specifying field values to save
When creating or editing a record, the fields in the view will populate the new or existing record. Any fields in the view with the same name as a field in the table will populate that field with its data. The view field can be a calculation as well as a standard field.

Fields which will be saved, i.e. those which match a calculation or field in the view will be marked in white at the top of the workflow panel.

### Relation fields

If you want your workflow to set the value of a relation find, i.e. link to a particular record, there’s no need to create a calculation for it, just include the ID field for the record you want to link to in the view.

If creating a calculation is easier, you can still do that. Either create a numeric calculation which outputs the internal row ID of the record to link to, or the text of the primary value for the relation. If the latter case, the field for the primary value in the related table should be unique and marked as such in the field options.

To set a relation field to blank, add a numeric calculation with the name of the field as normal, but set it to output the value -1.

## Options
When using a workflow to create new records or update existing ones, there are some other options in the workflow editing panel which are relevant:

