---
title: "Table layouts"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Customise a table's form on-screen
---
For each table, agileBase will automatically build a data entry form for users to view, add and edit records with.

The layout of this form can be controlled by selecting a layout option and adding separators to create blocks i.e. groups of fields which go together. This will create a more pleasant and usable system.

## Layout
The layout option is the main control. There are three options
1. **single column** - a simple vertical list of fields
2. **blocks in two columns** - makes the best use of screen space for large forms. Also allows tabs
    - All fields before the first separator are displayed in a section at the top of the screen, in two columns
    - After that, each separator added creates a new block of fields. Blocks are arranged in two 'newspaper' style columns which are displayed below the top section
    - If the table has tabs, they are displayed below the top section
3. **process flow** - blocks of fields are arranged vertically one after each other, works well when there the data entry form maps to a set process

Here's what the same data entry form looks like in each of the three configurations

**TODO: image**

and here's an example of **2. blocks in two columns** with tabs.

**TODO: image**

## Separators
To form a block, click on the _fields_ tab of a table and add a field of type 'separator' - see the [fields reference](https://todo.com). Move it to where the start of the block should be i.e. before the first field in the block.






