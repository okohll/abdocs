---
title: "Fields"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 40
description: Table fields
tags:
- Architect
---
Adding fields to a table creates a form by which people (and other sources such as the [API]({{<relref "/docs/integrations">}}) or [workflows]({{<relref "/docs/workflows">}}) can enter data.

There are various types of fields and field options which this section will cover.

## Adding a field
1. Expand the _Build Tables_ menu in the lefthand sidebar
2. Select the table to add a field to
3. Click on the pencil icon in the toolbar, if necessary, to edit the table
4. Click the _fields_ tab at the bottom of the screen
5. From the controls at the bottom of the list of existing fields:
    - Type in a field name, optional description, choose a type and press the _Create Field_ button
6. Optionally, drag and drop the field to a desired location relevant to other fields

## Field level help
Any description added to the field will be used as inline help. URLs can be included and will be turned into clickable links. See [help]({{<relref "/docs/adding-help">}}) for more information.

## Editing a field
Field name and description (help text) can be altered at any time by clicking them. Fields can be moved on screen by dragging. Options can be altered by clicking the _edit options_ link for each field.

However, once set, the field type can't be changed. A number field can't be converted to a text field for example. In particular, a decimal number can't be converted to a whole number field and vice versa, as integers and floating point numbers are different data types.

There is a process available for changing field types, please see [changing field types]({{<relref "/docs/advanced-usage/build-patterns#switching-a-field-from-one-type-to-another">}}) if you need to do that.

## Removing a field
In the _fields_ tab, click the _remove_ button to the right of a field.

If the field is used in any other locations in your application, such as a [view]({{<relref "/docs/views">}}), you'll be alerted to the fact. You'll need to first remove the field from those locations before being able to remove it.







