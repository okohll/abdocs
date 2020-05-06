---
title: "Adding and removing"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 40
description: The basics of working with tables
---
A table is a store of data of a particular type e.g. a company, contact, product or invoice. Tables are the fundamental building blocks of an agileBase application.

## Adding a table
1. Expand the _Build Tables_ menu in the lefthand sidebar
2. Click _create a new table_ at the bottom of the list of existing tables
3. Name the table
4. If necessary, click the pencil icon in the toolbar to see the details of the table you just created.

**TODO: image**

You can change the table's name and add a longer description under **Purpose**. This description will be used as help text in the user interface.

### Naming tables
When naming a table, it's best to use a plural form. Also avoid filler endings like 'info' or 'details'. So rather than 'company info', you might call a table 'companies'.

The reason for this is that the user interface will automatically convert plural names into singular forms where appropriate. So for example if there's a plus button on the screen to allow the user to add a new record in the table, it will automatically recognise the table and title the button Add Company.

If you build a large system with lots of tables, you may find it a good idea to prefix table names using a numbering/lettering system e.g. 
`a) table 1`
`b) table 2`

In the administrator interface, tables are listed alphabetically, so you can arrange the tables into a logical order with this method.

The user interface will strip out any prefixes when displaying names to users, if they end with a closing bracket `)`. 

## Removing a table
Before removing a table, you first need to remove all views and fields.

It's not necessary to remove actual data records from the table first.

A list of existing views is visible in the _manage_ tab of the table, at the top right. Visit each view and delete it.

Then next to the table's manage tab is the _fields_ tab. Delete all the existing fields from here.

When deleting views and fields, you may find you have to first delete other views or fields they depend on. In complex systems there can be chains of objects that need to be deleted in order.

Deleting is a destructive process so is not highly automated on purpose, to avoid accidental deletion. However at each stage you'll be shown any dependencies which have to be removed first, so you can follow through the chain.

Once all views and fields have been deleted, you may need to reload the table by choosing it from the list under _Build Tables_. In the _manage_ tab, the _Delete Table_ button should now be enabled and you can click it to perform the final step of the deletion.