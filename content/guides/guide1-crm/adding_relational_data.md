---
title: "2. Capturing Company and Contact data (Introducing Relational Databases)"
date: 2023-08-16T13:00:00+01:00
type: docs
weight: 30
description: "Introducing the power of Relational Databases... adding the ability to capture Company and Contact information to start building our CRM."
tags:
- Citizen Developer level 2
- v6
- Relational Data
- tabs
---
**Learning Aim:** Create related Tables to demonstrate the power of relational databases

**Prerequisites:** User to have watched “Creating a basic task list” video"

### Introduction
In this step of the guide we will build the engine of our CRM and in doing so start to introduce the concept of a relational database. We will do this as a practical example and you’ll see how agilebase makes this straight forward. We will be building a bigger system, but for the most part it’s simply reusing things we’ve already covered.. Let’s start with building a table called ‘Organisations’

## Create a table called "Organisations"
To get our CRM going we need somewhere to store information about the organisations we will interact with. This can easily be achieved by adding a new table, a tile and an initial view. If you need a quick refresher watch the video below, or if you need more detail go back to [step 1]({{<relref "/guides/guide1-crm/tasklist">}})

[guide 2 - video 1]{{<youtube id="F-4Qp-5udsU">}}

## Create a table called "Sites"
A company might have more than one location, so we will need a table to hold information about the various addresses they might have - 'Sites'. This is the first example we have of adding a Relation field.
 If you want to learn more then please visit [relational database concepts]({{<relref "/docs/tables/relational-database-concepts">}})


[guide 2 - video 2]{{<youtube id="psJRDyW3RMs">}}

## Create a table called 'Contacts'
Let’s add another table of data that is related to an Organisation, the people who work there - 'Contacts'.
We will link to two tables, the organisation they work for and the site they primarily work from. 

[guide 2 - video 3]{{<youtube id="Mrj6Iu7fxmg">}}

## Adding tabs
Viewing and adding data in isolation doesn’t feel very natural. What we want to do is look at an organisation’s records and see its list of contacts there and then. One way Agilebase does this is through adding ‘Tabs’ to a record.
 If you want to know more visit or documentation about [tabs]({{<relref "docs/tables/hierarchy-navigation/tabs">}})

 [guide 2 - video 4]{{<youtube id="nRSQ3IARLVI">}}

 ## OPTIONAL - Linking Tasks to Organisations
 At this point you may decide to upgrade the Task system we created previously. If you want to do this you will need to update the Tasks table to have a Parent Org, adding a Relation field (to organisation) and then adding the new Tab to the Organisation table just as we’ve done before.
You might also want to go back in to some of the views people use to access tasks and add a field so they know which organisation it's for.