---
title: "Referenced Data Field Options"
date: 2020-05-12T16:40:00+01:00
type: docs
weight: 120
description: Options specific to referenced data fields (where data is pulled in to display in a form from other places in the system)
tags:
- Citizen Developer level 2
- v6
---
## Use as a filter for relations
See [Common build patters - custom filtering when using a relation]({{<relref "/docs/advanced-usage/build-patterns#custom-filtering-when-choosing-a-relation">}})

## Prominent
Make the background of the referenced panel bright red - useful for showing warnings on screen.

## Display of fields
Controls the display style - what content should be included the output, and also the format of the output: a standard panel, or various tabular styles, often used when there's lots of data.


The options are
* **Content fieldnames** - show the names of fields inside the panel, but not the fieldname of the panel itself (the default)
* **Panel fieldnames and content fieldnames** - show all, as per the above screenshot
* **Panel fieldname, no content fieldnames**
* **No fieldnames** - show only the field values, useful particularly when there is only one value and when the context is obvious
* **Tabular** - show all data from the referenced view in a table
* **Tabular - transposed axes** - the same data but with rows and columns (x and y axes) swapped
* **Tabular - key/value** - similar to the standard panel format, but in a table, i.e. the first column is for the field names, the second for values
* **Tabular - pivot table** - a pivot table where the first field in the view is used as a heading, the second as a vertical column. All other data is amalgamated and displayed in the cell for each heading/vertical combination.  
### Examples
A simple example, the field name can be hidden, which can be useful if for example you wish to create a referenced panel showing a warning message. You may want to just show the contents of the warning. In other cases, you may wish to hide the field if it's not necessary as it's obvious what the values are without additional context.

![Panel field names](/referenced-panel-fields.png)

A panel display style

![Panels screenshot](/referenced-panels.png)

One of the tabular styles

![Table screenshot](/referenced-tabular.png)

A pivot table

![pivot table example example output](/pivot-table-example.png)



