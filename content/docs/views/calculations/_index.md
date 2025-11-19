---
title: "Calculations"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 80
description: Adding calculations to a view
tags:
- Citizen Developer level 3
- v6
---
The ability to add calculations to a view opens up a world of possibilities. Within the confines of the SQL language, there's no limit to what you can do, and those confines contain a pretty large space.

This is the only area of Agilebase which requires some 'semi-programming' to use - using snippets of SQL. However, SQL is a standard, widely popular and the AI is there to help as you get started.

We'll start with some simple examples, then move on to some more advanced ones, but even then we won't cover every capability so will point you to specific further resources and references.

But first, what are the mechanics of creating a calculation and adding it to a view?

## Adding a calculation
1. Open the view you want to edit
2. Toggle development mode on and click the big pencil at the top left of the screen
3. Under _fields_, from _Add Calculation_ choose a type (text, number etc.), give it a name and press _Add_

The calculation editing screen panel now open to the right and you can type in your calculation.

Before doing that, we'll quickly review the main areas of the calculation editing panel. There are
* **Name** - you can rename the calculation at any time
* **Type** - as opposed to a standard field, you can change the type of a calculation at any time, e.g. from text to numeric or vice versa
* **Calculation definition (SQL)** - the actual contents of the calculation
* **Comments or description** - a place for you to enter your own notes about the calculation, maybe as an explanation of how a particularly complex calculation works for example

The other options available we will cover below.

Now we can get to the fun stuff and think of a calculation.

## Using the AI
Agilebase's AI will create a calculation for you, using SQL syntax, so if you're unfamiliar with SQL don't worry, that's no barrier.

1. When editing a calculation, enter a description of what you want to achieve in the _description_ box. Reference any fields you want to use by name.
> For example, type 'VAT (at 20%) for the invoice line amount', if you are in a view of invoice lines and you have a field called 'invoice line amount'.
2. Press the 'AI: Generate Calculation' button
3. If the result looks acceptable, press 'Update' to save the calculation

> The AI can only utilise fields available in the view's parent table, plus any joined tables or views. So for example if you are editing a view of invoices and you want to add a calculation for 'total invoice line amounts per invoice', you must join to the invoice lines table first.
> See [joins]({{<relref "/docs/views/joins">}}) for more information

> Note that the description you provide, along with a list of existing fields in any joined tables will be sent to the third party AI provider.
> Please check that you are happy with their [privacy policy]({{<relref "/docs/artificial-intelligence#data-privacy">}})

To enter and edit calculations manually, read on.

## Basic examples
Firstly, we can of course do maths. So in the calculation definition, you can enter things like
* `1 + 2`
* `2 * 3` (multiplication)
* `10 / 2`
* `5 ^ 3` (five to the power 3)

> For those of you who may have used SQL before, remember you don't need to start the calculation with `SELECT`, you're not writing a whole statement, just a snippet of SQL to form a calculation

## Referencing fields
Calculations normally need to act on existing data. We can include references to other fields, including other calculations, in the view by writing out the field name surrounded by curly brackets.

Some examples might be
* `{net price} * 0.2` (calculate VAT amount)
* `(({sale price} - {cost}) / {cost}) * 100` (calculate the profit of an item as a percentage)

You can reference not only other fields and calculations in the view, but also fields and calculations from any view or table joined to the view. The syntax for that is `{source name.field name}`. Underneath the calculation editing space is a list of all fields that are available to be added, for reference. You can just copy and paste them into your calculation.

## Special functions
In the same way that you reference fields, you can also reference some special functions that output other information:
* `ab_tile()` - the name of the tile the user has open (not necessarily the same as the tile the workflow view is in)
* `ab_view()` - the name of the view the user has open (again, not the name of the workflow view that is running)
* `ab_userid()` - the currently logged in user, in the format 'Forename Surname (username)' i.e. the same format used for logging record creation metadata etc.
* `ab_userroles()` - a comma separated list of rolenames the logged in user belongs to

## Colouring
Text calculations can be coloured in the same way as text fields. Underneath the calculation definition and words, tick _colour words_. If a calculation outputs one of the following words, they cell in the view be coloured.

![Word Colours](/word-colours.png)

## Automatic suggestions
It doesn't pay to re-invent the wheel. As systems become larger, it's likely calculation written for one view might be useful for another as well.

In some cases, when you start to type the name of a calculation to add, the system will syggest already existing calculations from other views. Clicking those will import them as references, so you don't have to recreate it again from scratch. Choosing a datatype (text, number, date etc.) will change the suggestions to only those of a matching type.