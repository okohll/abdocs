---
title: "Cross Reference Field Options"
date: 2020-05-12T16:40:00+01:00
type: docs
weight: 120
description: Options specific to cross-reference panel fields
tags:
- Architect
---
## Tabular display
Rather than displaying rows from the referenced view as panels

![Panels screenshot](/referenced-panels.png)

show a table

![Table screenshot](/referenced-tabular.png)

which is a more compact form allowing a greater volume of data to be shown in a smaller area.

## Use as a filter for relations
See [Common build patters - custom filtering when using a relation]({{<relref "/docs/advanced-usage/build-patterns#custom-filtering-when-choosing-a-relation">}})

## Prominent
Make the background of the referenced panel bright red - useful for showing warnings on screen.

## Display of fields
Controls whether field names are displayed in the panel as well as values. Hiding the field name can be useful if for example you wish to create a referenced panel showing a warning message. You may want to just show the contents of the warning. In other cases, you may wish to hide the field if it's not necessary as it's obvious what the values are without additional context.

This option actually controls two types of field name, that of the referenced panel itself and also those of fields displayed inside the panel.

![Panel field names](/referenced-panel-fields.png)

The options are
* Content fieldnames - show the names of fields inside the panel, but not the fieldname of the panel itself (the default)
* Panel fieldnames and content fieldnames - show all, as per the above screenshot
* Panel fieldname, no content fieldnames
* No fieldnames - show only the field values, useful particularly when there is only one value and when the context is obvious


