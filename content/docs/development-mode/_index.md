---
title: "Development Mode"
date: 2022-02-18T16:40:00+01:00
type: docs
weight: 5
description: Introducing agileBase's development mode and how to toggle it on and off
tags:
- Developer
---
As a no-code platform, agileBase allows you to easily construct (and later de-construct or 'refactor') and change your software.

## Toggling development mode on and off
![Toggle development mode](/toggle-build-mode.png)
To get started, you need to toggle from 'normal' mode to 'development' mode. You can do this wherever you are in the system and you will switch to building or developing the item you're looking at. The three main areas this covers are:
1. The homepage. Toggling to development mode on the homepage shows an overview of everything in the system - tables, views, tiles, roles and users can all be listed and edited. Furthermore, the connections between different objects can be shown. More advanced users will typically use this area, when working on larger systems.
2. In a [view]({{<relref "/docs/views">}}). When a view is open, toggling development on will let you edit that view - to add or remove fields and calculations for example.
3. When viewing a record from a [table]({{<relref "/docs/tables">}}>), toggling development on will let you edit that table, e.g. to add/remove fields.

When development mode is on, pencil icons will appear next to every object which can be edited: for example, next to every field and tab in a table record.

When editing views and tables, the large pencil at the top left lets you edit the object as a whole, as opposed to a field or a tab in it.

Development mode can easily be toggled off again when you're done and the user interface will switch back to 'normal' mode.

## Using editing panels
When development mode is on, clicking any of the pencil icons on screen will open a panel allowing you to edit the item it's next to. The panel can be dragged to move it around the screen if you want to see what's underneath. Whenever you make a change using the panel, the display underneath will update, allowing you to see the effect your changes have in real time.

## Example videos
Here's an example of editing a table and view:

{{< youtube id="mTOWsXDpQgo" >}}

and here's what the development mode looks like on the homepage:

{{< youtube id="Rojcf6OzdHw" >}}

## Accessing additional debugging information

Later on down the route of creating applications, you may wish the user interface to show additional information, specifically in views, to show the primary key values for each record - the internal row identifiers - which are normally hidden.

This can be useful when testing and debugging [APIs]({{<relref "/docs/integrations">}}) for example.

To enable this, add `&set_context=systadmin` to the URL in the browser. To revert to normal mode, replace it with `&set_context=business`.
