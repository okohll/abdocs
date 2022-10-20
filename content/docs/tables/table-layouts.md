---
title: "Table layouts"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Customise a table's form on-screen
tags:
- Architect
---
For each table, Agilebase will automatically build a data entry form for users to view, add and edit records with.

The layout of this form can be controlled by selecting a layout option and adding separators to create blocks i.e. groups of fields which go together. This will create a more pleasant and usable system.

## Layout
The layout option is the main control. There are three options:
1. **single column** - a simple vertical list of fields
2. **blocks in two columns** - makes the best use of screen space for large forms. Also allows tabs
    - All fields before the first separator are displayed in a section at the top of the screen, in two columns
    - After that, each separator added creates a new block of fields. Blocks are arranged in two 'newspaper' style columns which are displayed below the top section
    - If the table has tabs, they are displayed below the top section
3. **process flow** - blocks of fields are arranged vertically one after each other, works well when there the data entry form maps to a set process

![Tags and options](/tags-and-options.png)

Here's what the same data entry form looks like in each of the three configurations

![single column layout](/layout-single.png) "single column"

![two column layout](/layout-two-columns.png) "two columns"

![process flow layout](/layout-process.png) "process flow"

and here's an example of **2. blocks in two columns** with tabs.

![form with tabs](/layout-tabs.png)

## Separators
To form a block, click on the _fields_ tab of a table and add a field of type 'separator' - see the [fields reference]({{<relref "/docs/fields/field-types/special-field-types/separators">}}). Move it to where the start of the block should be i.e. before the first field in the block.

## Record titles
In the screenshots above, you can see that each record has a heading, or title. drawn from the data.

To set one or more fields to include in the title, use the field option [use as record title]({{<relref "/docs/fields/field-options/text-field-options#use-as-record-title">}})

## See also
When a relation field is near the top of the form, it's also moved to the record title level to become a title link, allowing navigation upwards to the 'parent' record. See [hierarchy navigation]({{<relref "/docs/tables/hierarchy-navigation">}}) for info about upwards, and downwards, navigation.






