---
title: "Changing Field Types"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: How to change a field from one type to another
tags:
- Principal Architect
---
Once a field has been created, the type can't be changed with the flick of a switch. However there is an easy to follow process to accomplish this.

1) Rename the field to `[fieldname] old`
2) Add a new field `[fieldname]`. This means that any calculations that reference the field won't have to be changed and won't break due to mis-matching field names
3) Copy all values from one field to another. The easiest way is to use a [workflow]({{<relref "/docs/workflows">}})
4) Try to delete the old field. If any views reference it, the delete will fail and a list of them will be shown
5) Edit all those views
    - remove the old field and add the new, to all fields, filters etc.
    - update all calculations that reference the field e.g. add a space to the end of all of them. That will refresh them to reference the new field rather than the old
6) Finally, delete the old field

> Before starting, it will be worth ensuring that data won't change during the process, for example by making the data read-only to all users, or requesting they don't edit field values until finished.
