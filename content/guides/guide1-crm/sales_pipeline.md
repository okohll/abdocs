---
title: "3. Adding a Sales Pipeline - Kanban"
date: 2023-08-16T13:00:00+01:00
type: docs
weight: 40
description: "Adding Sales Opportunity management to our CRM - using a Kanban board and DropDown fields."
tags:
- Citizen Developer level 2
- v6
- Kanban
- DropDown
- Sales
---
**Learning Aim:**  Introduce Kanban / Card view. Power of dropdowns on fields. Show how easy to add graphs. Show off the advanced UI elements of aB

**Prerequisites:** User to have watched “Capturing Company and Contact details” video. Understand relational data

### Introduction
In this step of our guide we going to look at adding a dropdown field to "control" data input as we want to set up a Kanban board approach to managing Sales Opportunities.
This video assumes you are happy creating tables so jumps to the point of adding the Dropdown field.
If you are following along and want to build this table please copy the following table structure 

Fields we will need: Organisation(relation to Organisation) Title (text), Detail (text large), Date of Enquiry (date), Source (text), Main Contact (relation to contact), Opp. Owner (text), Demo-Meeting (Separator), Date of Demo (date), Meeting Notes (text large), Quote (Separator), Quote Amount (number), Quote notes (text large), Outcome (Separator), Date Won (date), Date lost (date), Lost reason (text), closed by (text), closed date (date)

![Sales Opprtunity Fields before Status DropDown has been added](/Sales_Opportunity_pre_dropdown)

## Adding a dropdown field
A dropdown field is as simple to add as any other field type. However there are some considerations about how it is configured to help the user experience. 
1. Having an initial comma in the list means the default value will be blank. 
2. Adding an initial number to each option in the list is very useful to imply an order (an override the default alphabetical ordering).
3. Autofilling with a list of users. [Click here for more info]({{<relref "/docs/fields/field-options/text-field-options/#lists-of-users">}})

In this stage of our guide we are going to add the stages a typical Sales opportunity will pass through.
[Guide 1.3 - video 1]{{<youtube id="1PzY64hPWlE">}}

## Creating a Kanban view
We can now create a view to show all the Sales Opportunities we will be mansaging.
This is the basically the same as we’ve done before
[Click here to see how add a view]({{<relref "/guides/guide1-crm/tasklist/#adding-views-that-show-all-the-tasks-that-have-been-createds">}})
Before We set the interface option to be "Cards in Column" its important to move the controlling field to the top of the list. In this case we want ther Kanban board to be controlled by Status, therefore it should be the first DropDown field in the view. 

[Guide 1.3 - video 2]{{<youtube id="ydCtGAdgqjk">}}

## Adding Graphs!
Sales teams love graphs. After all, a picture says a thousand words, and agileBase has an easy to use graphing facility to help you show off the insights your data contains.
Creating graphs can be done by any user, but it usually helps if the developers take the lead and build the obvious ones.

This video demonstrates adding a pie chart to show the number of Sales Opportunites by Source, and also a column graph to show volume of sales enquires over time. It also shows the advanced option of using Stcaking to add more insights.

[Guide 1.3 - video 3]{{<youtube id="3FOOk8QS5RE">}}