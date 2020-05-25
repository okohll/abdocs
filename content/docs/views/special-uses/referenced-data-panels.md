---
title: "Referenced Data Panels"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 120
description: Using views to embed data from other parts of the system into a data entry form
---
It can be useful to include calculations and data from other parts of the system in a form, to add context and optionally allow editing of that related data.

To do that, a [referenced data field]({{<relref "/docs/fields/field-types/special-field-types/referenced-data">}}) can be [added to the form]({{<relref "/docs/fields">}}). When adding this field, the administrator can choose a view to reference, the data from which will display in the form.

The way it works that a when a particular record is shown on screen in a form, the row ID of the record being edited is used to filter the results of that view. Records from the view that include that ID are displayed in a panel.

Referenced data can also be used to
* display charts
* provide default values for form fields
* show a workflow button - if the referenced view is a workflow, a button to run it will display

Full details of all of these features can be found on the [referenced data panel]({{<relref "/docs/fields/field-types/special-field-types/referenced-data">}}) page.