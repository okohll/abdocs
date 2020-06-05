---
title: "Number Field Options"
date: 2020-05-12T16:40:00+01:00
type: docs
weight: 100
description: Options specific to numeric fields
---
## Colour outliers
Automatically highlight 'unusual' values of this field in views. This can help pick out values which are notable in some way, for example if a number has been entered without a decimal point by mistake (1253 instead of 12.53) or is a statistical outlier.

Specifically, if the value is more than 4 standard deviations away from the mean, it's strongly highlighted in green (for values greater than the mean) or red (for values less). Values more than 2 standard deviations away are highlighted in a weaker shade.

## Separate thousands and use totals
In views and data entry screens, show numbers as e.g. 31,141,592 rather than 31141592.

Also when the field is added to a [tab view]({{<relref "/docs/tables/hierarchy-navigation/tabs#tab-view">}}), a total is displayed at the bottom of the column of numbers for it.

## Use duration
The view displays the same in views, but in data entry forms, is entered as a time duration, specifically a number of hours. So for example the number 1.5 would be entered as 01:30 (1.5 hrs = 1 hr 30 minutes). This allows time durations to be entered into e.g. timesheets in a natural fashion, but also time to be totalled up easily.

## Precision
The number of decimal places to show numbers to. 

his affects display only, so for example if 1.543 is entered into a field with 1 decimal place, it will display as 1.5 but will still be stored as 1.543 and any maths done on the field operate on the higher precision value.

> Note - integer and floating fields are actually different field types in the underlying database, so if a number is created with 0dp i.e. as a whole number, it can't later be converted to floating point by changing the dp. There is a process that can be followed for [converting fields from one type to another]({{<relref "/docs/advanced-usage/build-patterns#switching-a-field-from-one-type-to-another">}}).

Whole number fields can store integer values from -2,147,483,648 to +2,147,483,647, i.e. approx. -2 billion to +2 billion. Decimal number fields have a range of around 1E-307 to 1E+308. See notes for _integer_ and _double precision_ types here: https://www.postgresql.org/docs/current/datatype-numeric.html

If you need to store values of greater range or accuracy, please let us know.

## Value
Set a default value for the field, which will apply when a new record is created.