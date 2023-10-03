---
title: "Separator Options"
date: 2020-05-27T16:40:00+01:00
type: docs
weight: 110
description: Options specific to separators, which form groups of fields into blocks
tags:
- Citizen Developer level 2
- v6
---
A [field separator]({{<relref "/docs/fields/field-types/special-field-types/separators">}}) creates a block of fields, starting with the separator and ending at the next one (or the last field in the table).

These blocks can either be initially contracted, or expanded. Here's a screenshot showing a number of contracted blocks, with one expanded.

![blocks one expanded](/blocks-one-expanded.png)

## To program the initial state of the block
1. [Create a view]({{<relref "/docs/views/creating-a-view">}}) from the table the separator is in
2. Add [filters]({{<relref "/docs/views/filters">}}) to that view that leave only records which the block should be expanded in present
3. In the _fields_ tab of the table, click _field options_ and select the view for the _expand if record in view_ option

There are two other selections that can be made for the _expand if record in view_ option other than selecting a view.
* expand if under 10 blocks on the screen
* expand never

Remember, these just set the initial state of the block when a record is first opened, blocks can be expanded and contracted by the user at any time.

## Place tabs here
Normally, the first time a separator is encountered, as well as starting a block, any tabs which the table has will be shown in a row just before the block.

To prevent that, un-tick this option. Then the block will be created but the tabs row won't be displayed until another separator is encountered, with _place tabs here_ ticked.
