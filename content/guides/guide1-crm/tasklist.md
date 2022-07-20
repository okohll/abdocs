---
title: "Creating a basic task list"
date: 2022-04-22T13:00:00+01:00
type: docs
weight: 20
description: "Demonstrates the basic processes of building a simple application, a good starting point"
tags:
- System Builder
---
**Learning Aim:** Create a Table and associated Views to use it!

**Prerequisites:** User to have watched "How to use agileBase"

### Introduction
This stage of the guide will introduce you to the basic activities required to build a simple application. We will start by creating a table with different types of fields in order to store a variety of data. We will then show you how to create and control tiles, views and forms which are the interfaces that your users will use to enter and consume this data.
Let us start by building a simple task list.


## Create a table called "Tasks"
Our simple application will need to store information about the tasks our users create. This is done by creating a database table. In agileBase this is achieved by navigating to the developer interface and pressing the “add new table button”. 
[guide 1 - video 1]{{<youtube id="r7nkYcnjyeQ">}}
           
## Add fields to the "Tasks" table
A table of data is nothing without its list of fields. Each field stores a single piece of information. It is simple to add fields to an existing table within agilebase. 
Edit the table, type in the name of the field and choose the appropriate type. On creation of the field you will be able to set further options. 
For more detail visit - https://docs.agilebase.co.uk/docs/fields/field-types/
           
In the following video we add the fields needed to for a simple Task
[guide 1 - video 2]{{<youtube id="QgKRVSMM07Y">}}           

## Make the form easier to understand. Break it into sections
Now we have the data structure required to capture a simple task we can think about how it would be used. The user interface within agileBase is controlled by the list of fields and their options. It is a simple task to reorder fields, just use the drag and drop facility when looking at the list of fields. 
Use a field of type separator to create sections within the user interface
[guide 1 - video 3]{{<youtube id="YwthqTiTroM">}}   

We now need to provide the user with a way of accessing our “tasks” table and using it!!! This is achieved by a combination of Tiles and Views.
           
For more info on Tiles - https://docs.agilebase.co.uk/docs/tiles/
           
For more info on Views - https://docs.agilebase.co.uk/docs/views/ 
           
In summary: 
A view generally provides abbreviated data in the form of a list of records. It also provides the ability to drill through to see the full record details. 
Tiles are a way of grouping functionality together. Specifically, a data tile is a way of grouping a collection of views that all share some common theme. 

For this guide, we need a tile and collection of views dedicated to helping us create and manage our “Tasks”

           
## Make the table available for use!
### Adding a tile to the homepage
The homepage of agilebase is made up of data tiles. We need to create a new tile to hold all the views of our taks data
[guide 1 - video 4]{{<youtube id="7hA7-VzX_A8">}} 
           
### Adding views that show all the tasks that have been created
To provide the user access to a list of Task records we need to create a View. To start with we will create a view that will list ALL the data.      
[guide 1 - video 5]{{<youtube id="P4FnZIYmAIo">}}           
           
### A better way of looking at data
Many users will be familiar with a card or kanban style interface (such as Trello). Agilebase has a similar style of view that can often be useful.  
Within a views “options” tab you can set its interface stylle to be “Cards in Columns”
[guide 1 - video 6]{{<youtube id="GN7685gOnQ0">}}
           
### Making views for a specific job
Whilst users can apply their own filters and re-order data in a view, it is often a better user experience if there are dedicated views setup that match a particular job. For this example we want to create a list of all the completed tasks with the most recent at the top of the list.
For more information on applying filters - https://docs.agilebase.co.uk/docs/views/filters/ 
[guide 1 - video 7]{{<youtube id="wvlUpjFhxJg">}}
          
### Our simple application is complete!
However, we can quickly see that we have missed implementing a key feature - collaboration. We should add another field to this table - a comments field!
           
For more information on the comments field and its associated comment feed - https://docs.agilebase.co.uk/docs/fields/field-types/special-field-types/comment-feeds/

           
## Add a Comments field to a table!
Adding new fields to an existing table is no different to when creating from scratch. Simply add via the table edit screen.
Adding collaboration functionality to an agileB\se application is as easy as adding any other field! Just add a field of type Comments as shown in the video below
[guide 1 - video 8 *]{{<youtube id="d57CDMWmUW4">}}    
        

> For completeness the remainder of this stage of the guide covers removing items and functionality that are no longer needed.
           
## Deleting Views 
Eventually you will want to remove unused views in order to reduce clutter and streamline the user experience. To do this go to the Properties and Options tab when editing the view and press Delete view 
[guide 1 - video 9 *]{{<youtube id="YfCz-9Fjt7g">}}  
           
## Delete Fields and Tables 
Keeping the user interface streamlined and uncluttered also includes the removal of unwanted or old data fields.
It is straightforward to delete a field from a table. Either clicking the X icon on the RHS of the list of fields, or use the Remove field button on the fields definition. However, extra care needs to be taken as the field may be in use as the following video demonstrates.
           
N.b. to completely remove a table you are first required to delete ALL the fields it contains.
[guide 1 - video 10 *]{{<youtube id="5ExSypK06W8">}}             
