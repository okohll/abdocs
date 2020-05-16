---
title: "Creating a view"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 60
description: How to create a new view and place it in a navigation structure
---
In agileBase, a view 'belongs to' a [table]({{<relref "/docs/tables">}}). We'll see what that means in more detail below, but for now, just choose a table to show data from to users. In examples on this section of the documentation we'll assume we pick a contacts table.

We'll also assume we already have some tables and some [tiles]({{<relref "/docs/tiles">}}).

## To create a view
1. Expand the _Build Tables_ menu in the lefthand sidebar
2. Click the table you want to create a view from
3. If necessary, click the pencil icon in the toolbar to edit the table and click the _manage_ tab at the bottom of the screen
4. Press the 'Create new view' button at the top right. You'll be prompted for a name.

> There is an option **Populate the view with fields from this table** next to the _Create new view_ button. This is a convenience feature, which is ticked by default. When it's ticked, the view created will contain all fields from the table - you can then remove any you don't need. When un-ticked, the view will start with no fields so you can add just those you wish.

## Organising into a navigation structure
On creating a view, its manage tab will appear. One of the first things it's useful to do is put the field in a tile - use the _Tile_ dropdown option to do so.

Within a tile, the view can be added to a menu by editing the view name. Simply prefix the view name with a menu name and a dash. So for example, naming a view `contacts - all contacts` will create a 'contacts' menu containing the view 'all contacts' visible to users.

Entering a view _Purpose_ in the space underneath the name will provide help text for the view. This will be displayed in the menu underneath the view name. Here's a screenshot of a sample menu, each with purpose completed.

** TODO: screenshot **

## Using a view
Once the view is created, how can someone use it? We won't work through every possibility here as this documentation is for administrators rather than users, but here are some of the most important points in brief you may like to be aware of in order to support apps you build.

### Finding data
By default a search box appears under each column heading (the system can also be configured in a simplified way with a single search box to cover all fields).

The help icon (?) to the left of the search boxes details the types of search that can be performed. There are many, allowing for e.g. date-based searches, _and_ and _or_ searching, finding empty values etc. Helper features pop up for some field types, like date range pickers for example.

### Seeing summary stats
Hovering over a column shows summary statistics, like a total and average (of all filtered records) for numeric fields, or a breakdown of dropdown/tags fields.

### Loading a record
Once a record has been found, click a row in the view to load that record for viewing or editing. The record loaded comes from the table that the view belongs to (as referenced at the start of this page), even though the view may contain fields from other tables as well.

IT's also possible to use [inline editing](https://todo.com) to edit the contents of fields directly in the view.

Pressing the plus button to the left of the view contents will create a new record in the view's parent table.