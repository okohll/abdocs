---
title: "Workflows Buttons"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 230
description: How to setup a Workflow to fire from a Button
---

Some workflows need to be run on an adhoc basis, initiated by a user.
In these instances it can be useful to assign the Workflow to run behind a Button.

> N.b. In both cases below it is necessary for the Workflow to marked as Manual. 

## Workflow Buttons on a Form
To add the Workflow button to a Table's form simply create a new field of type Cross Reference with the workflow as the source.
When the Workflow is run, it will be filtered by the Id of the record. (You may wish read up about [Chaining Workflows]({{<relref "/docs/workflows/advanced/chaining-workflows">}}) )
It is often necessary to put some thought in to the visibility of the button - it can be confusing to the user that a button is present when it does nothing due to filters they cann not know about.


## Workflow Buttons on Views
Some Manual workflows are more appropriately run on a number of records. As such the ability to run them is likely to be associated to a list presented in a view.
1) Create the workflow view
2) Find or create a view we'll call 'display view', which displays an appropriate list of records - most likely this will show contain the same filters as the workflow view, so it shows the same records to the user.
2) In the display view, use the [Chain Workflows]({{<relref "/docs/workflows/advanced/chaining-workflows">}}) functionality. Choose the workflow view.

When the user opens the display view, a workflow button will appear at the top of the screen. Pressing this will run the workflow.

On completion, the user will be shown the number of records that were affected by the workflow run e.g. created or updated, along with an option to see the any log messages, which can be useful to check for errors.



