---
title: "Adding Help"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 90
description: "How to add inline help to aid users of your applications"
tags:
- Citizen Developer level 2
- v6
---
Help for the application you build can be added in at many levels of the user interface
* at the individual field level
    - add the help for each field when [adding or editing a field]({{<relref "/docs/fields#adding-a-field">}})
* for a block of fields
    - add the help for the [separator]({{<relref "/docs/fields/field-types/special-field-types/separators">}}) field marking the start of the block
* for a table
    - add the help in the _name and views_ panel when [editing a table]({{<relref "/docs/tables/adding-and-removing#editing-a-table">}})
* for a tab within a table
    - the help for the tab view is used, falling back to the help for the tab table
* for a view
    - add the help when [creating or editing]({{<relref "/docs/views/creating-a-view">}}) a view
* for a tile
    - add the help when [creating or editing]({{<relref "/docs/tiles#creating-a-tile">}}) a tile

If help exists for a particular area, a link is generally displayed on screen as a question mark icon. Users can click on this to show the help content. Where an icon is less appropriate, it is shown in other ways, for example on hover-over of an element. In the case of views, help is shown in the menu item for each view.

Help content can contain URLs, which are converted into links. Links to [YouTube](https://www.youtube.com) URLs are shown as videos in place.