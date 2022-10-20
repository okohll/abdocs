---
title: "Workflow"
date: 2022-05-11T12:40:00+01:00
type: docs
weight: 85
description: Running a workflow whenever a record is added
tags:
- Software Architect
---
The workflow panel of a table shows any [workflows]({{<relref "/docs/workflows">}}) which act on data in that table. In other words, any workflow that updates records, creates new records in the table, or deletes records from it.

Additionally, this panel allows you to choose a workflow to run whenever a new record is created, or (less frequently used) whenever a record is opened.

That can be very useful for setting initial values for fields, where those values may be more complex calculations than just a static default value.

## When a record's created, run workflow
Run a [workflow]({{<relref "/docs/workflows">}}) immediately after the creation of a record. The workflow runs after any field default values have been set.

> The workflow 'knows' metadata such as which user is logged in, which tile is open etc., so if you want to [use those in a calculation]({{<relref "/docs/views/calculations#special-functions">}}) in the workflow, you can do.

> Note that only workflows which have **Frequency = manual** set can be chosen to be run when a record is created. That's because a single workflow can't be used both to set initial values *and* to run every X minutes.

### Run this workflow whenever each record is viewed
As well as running the workflow on record creation, also run it whenever a user views a record in this table. Be aware this may have a performance impact for users, if the workflow is resource intensive and/or multi-step, particularly if records are also viewed frequently.
