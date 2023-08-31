---
title: "4. Calculated Datafields"
date: 2023-08-16T13:00:00+01:00
type: docs
weight: 50
description: "Demonstrate how easy it is to use one of the most powerful features of agileBase… Calculations"
tags:
- Citizen Developer level 3
- v6
- Calculations
---
**Learning Aim:**   Introduce calculations and basic SQL

**Prerequisites:** User to have understanding of relational data

### Introduction
The ability to use your existing data to calculate new information will dramatically enhance the user interface, and lead your users to create new data!
In this step fo the guide we'll start with something simple, expanding the data we know about Organisations.

## Calculating the number of contacts belonging to an Organisation
Using the All Organisations view as a starting point, clone it and rename it "Organisation - Calculations.
We will need to join down to the Contacts table, before we create our calculation field.
Go to “fields”, highlight the add a calculation section
Add a calculation called “Number of Contacts”, of type ‘Whole number’.
Press Add
The important area is the ‘Calculation Definition’. In this example we want to count the number of contacts each organisation has. We can do this by using a SQL statement called Count.
 
```
count()
```
Between the brackets we choose which field we want to count. In this case the contact record
```
count({contacts.id:contacts})
```
We now need to press update to tell agileBase we have finished editing our calculation. Press Update.
As you can see the system has correctly identified that count is something known as an aggregate field and ticked the box for us.
If you click back on Fields you should see the list and how calculations are highlighted in purple to distinguish from regular fields taken from a table definition. Lets drag our calculation near the front”
Move the calc.
Closing the edit allows us to see our results.
This is a very simple example of an SQL calculation. For more examples as well as a link to the underlying Postgres documentation visit - [docs- calculation]({{<relref "/docs/views/calculations/examples/">}})

[guide 1.4 - video 1]{{<youtube id="kxsIr6yHlNg">}}

## Calculating the Date of our Latest Sale to create a "Our Customers" list
A further useful example is to show how we can use the results of a calculation to create a Live view, for example "Our Customers".
Start by adding a join down to Sales opportunities
Instead of adding an existing Sales opportunity field let’s add a calculation
Go to list of fields and add a calculation called “Latest Sale”, which of course will be a ‘Date’ field.
Press Add
This time our SQL looks like 
```
 max({sales opportunities.date won})
```
The same aggregate field option should be ticked for us.
We can add a filter based on the values in the calculation e.g. where ‘Latest Sale’ is not blank!
You should now see your list of Organisations has dramatically shrunk
If you are following along, it makes sense for a Quick name change to make it “All customers”

[guide 1.4 - video 2]{{<youtube id="tGIsw4uhYZQ">}}
