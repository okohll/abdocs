---
title: "Basic Field Types"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 60
description: Text, number, date/time, auto-generated number sequence and checkbox fields
---
These are the core types of fields by which data can be entered by users (or other sources such as the API or a workflow).

## Text
Text fields are the most commonly used. Depending on [field options](https://todo.com), text can be entered into a standard data entry control, a large box allowing rich formatting (bold, italic etc.), chosen from a dropdown of options or added as tags.

## Number
When adding a number field, select a _precision_ from the dropdown. If `0` is chosen, then it will be a whole number (integer) field. If any other value is chosen, it will be a decimal field. The decimal precision can be changed at any time in the field options, but a whole number can't be converted to a decimal or vice versa via field options.

> See [changing field types](https://todo.com) for more information.

## Date
Represents a date or date/time, of any precision from year to second.

## Auto-generated number sequence
The value of this field will be generated automatically, incremented by one each time a record is created.

> Sequence numbers are never rolled back, even on the deletion of a record, so they can't be used if a gapless assignment of numbers is required.

## Relation
Adding a relation creates a link from one table to another. For example, a contacts table may contain a relation linking to an organisations table, to allow a person to belong to an organisation. See [relational database concepts]({{<relref "/docs/tables/relational-database-concepts">}}) for further info.

## Checkbox
Represents a boolean (true or false) value.