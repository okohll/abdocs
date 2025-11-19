---
title: "Calculation Best Practices"
date: 2020-05-19T16:40:00+01:00
type: docs
weight: 91
description: A few tips for working with calculations.
tags:
- Software Architect
- v6
---
## Centralise calculations
If a particular calculation is used in a number of different views, then it's a good idea to create it once in a 'utility' view, then [join to that view]({{<relref "../joins#joining-to-a-view">}}) from any others that want to include it.

To take a simple example, a VAT calculation `{net price} * 0.2` may be created in a 'vat calculation' view. Then any view wanting to display the VAT can just join to it and include the field. If any changes to the calculation need to be made in future, they then only need to be done in one place. The benefits of this increase as calculations become more complex.

## Avoid mixing aggregates and non-aggregates
Avoid mixing an [aggregate]({{<relref "examples#aggregate-calculations">}}) and non-aggrete parts in a single calculation. E.g. calculations of the form `sum({field 1}) + {field 2}` should be avoided. You may find they cause errors.

The recommended way to create a calculation like this is to make the aggregate part in a separate view, then join to it, as described under [centralise calculations]({{<relref "#centralise-calculations">}}) above.

## Splitting complex calculations into parts
If a calculation is particularly complex, you can if you like split apart into multiple calculations, to improve readability. A final calculation can then reference the parts, like e.g.

`({really complex calculation 1} + {really complex calculation 2}) / {really complex calculation 3}`

The rule not to mix aggregate parts and non-aggregate parts, as above, still holds.

> Just be aware that if you update one of the composite parts, you then need to update any calculations that depend on it. The system won't automatically update them to reference the new version. This is due to the way the database works under the hood - it doesn't natively support referencing one calculation from another, so we add that layer in Agilebase functionality.

## Comments
You may find it helpful to add comments to complex calculations to explain to others (or your later self) how it works:

https://www.postgresql.org/docs/17/sql-syntax-lexical.html#SQL-SYNTAX-COMMENTS

## Troubleshooting errors
If there is an error in a view, it's more than likely the culprit is a calculation, as they are one of the more complex facilities of Agilebase and the only one where SQL can be entered by the user, as opposed to be automatically generated. You may see messages like **view broken** or errors when you try to change a view e.g. move a field.

### Bad data
Errors can occur due to data changing. Division by zero errors are automatically handled by Agilebase (null is returned), but other types of calculation can also cause errors in certain circumstances. For example if a calculation squares a field, if someone enters a really large number into that field in a particular record, then an overflow error may occur.

This can be resolved by temporarily filtering out the problem data, then the view can be edited to handle the issue, or perhaps a [data integrity check]({{<relref "/docs/tables/data-integrity-checks">}}) can be added to disallow problem data in future.

### Wrong datatypes
If a calculation is set to be a number type but outputs text, that will cause an immediate issue. A more pernicious problem can be caused the other way round. If a calculation is expected to be a number, and used by other calculations as a number, but has actually been set or left as text (the default type), errors can occur.

### Persistent errors
If there is a persistent issue, one way of dealing with it is to temporarily delete all the calculation definitions - you can copy and paste them somewhere else for record-keeping, perhaps into each calculation's notes entry. Then once the view is working again, add the calculation definitions back one by one until you find the problem.
