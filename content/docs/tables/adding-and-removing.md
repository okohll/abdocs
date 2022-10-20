---
title: "Adding, editing and removing"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 40
description: The basics of working with tables
tags:
- Citizen Developer level 2
- v6
---
A table is a store of data of a particular type e.g. a company, contact, product or invoice. Tables are the fundamental building blocks of an Agilebase application.

## Adding a table
1. On the homepage, click the 'toggle' button in the top-right of the screen to enable dev mode (if it is not enabled already)
2. Click _+ Table_, choosing a name for the new table

**TODO: images**
![Add Table Button](/add-table-button.png)

You can change the table's name and add a longer description under **Help**. This description will be used as help text in the user interface.

### Naming tables
When naming a table, it's best to use a plural form. Also avoid filler endings like 'info' or 'details'. So rather than 'company info', you might call a table 'companies'.

The reason for this is that the user interface will automatically convert plural names into singular forms where appropriate. So for example if there's a plus button on the screen to allow the user to add a new record in the table, it will automatically recognise the table and title the button Add Company.

If you build a large system with lots of tables, you may find it a good idea to prefix table names using a numbering/lettering system e.g. 
`a) table 1`
`b) table 2`

In the administrator interface, tables are listed alphabetically, so you can arrange the tables into a logical order with this method.

The user interface will strip out any prefixes when displaying names to users, if they end with a closing bracket `)`. 

## Editing a table
There are two ways to edit a table: from the homepage, or from editing a record.

### From the homepage
When you toggle build mode with the toggle in the top right corner of the screen, you can see a _Map_ and _List_ items: the Map shows tables and relations between them, the List can show tables and also other entities, like views or users.

From either display, you can click a table to edit it. Once open, you can also pin tables with the pin icon at the top left of the editing panel. The table will then appear 'pinned' to the lefthand side of the development homepage and will remain there until unpinned, or you log out. This can be useful when working with a number of different tables.

![Connections mode](/homepage-connections-mode.png)
![List mode](/homepage-list-mode.png)

### From editing a record
When build mode is enabled, if you are viewing an individual record then clicking the big pencil at the top left of the screen lets you edit the underlying table.

![Editing a record](/editing-a-record.png)

## Removing a table
Before removing a table, you first need to remove all views and [fields]({{<relref "/docs/fields/#removing-a-field">}}).

It's not necessary to remove actual data records from the table first.

A list of existing views is visible in the _name and views_ section of the panel sidebar. Visit each view and delete it.

Then below to the table's _name and views_ section is the _fields_ section. Delete all the existing fields from here.

When you're done, you can click the _Remove table_ button in _name and views_.

When deleting views and fields, you may find you have to first delete other views or fields they depend on. In complex systems there can be chains of objects that need to be deleted in order.

Deleting is a destructive process so is not highly automated on purpose, to avoid accidental deletion. However at each stage you'll be shown any dependencies which have to be removed first, so you can follow through the chain.
