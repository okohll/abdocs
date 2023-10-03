---
title: "Integrations"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 100
description: Using the API and other data IO options to extract data from Agilebase and/or connect with third party systems
tags:
- Junior Software Architect
- v6
---

There are a number of ways to extract data from Agilebase, whether manually for an individual's use or programatically for integration with other systems. 

There are also multiple ways other than the user interface to enter data into Agilebase.

## Outgoing Data

Users are able to:
* Export Data to spreadsheet
* Generate Docs via a template
* Access attached files
* Print screen information

Third parties can access data via an API, either:
* PULL data
* PUSH data

There is also dedicated facility for integrating data with a Calendar
* Calendar Integration

Finally, data can be sent to third party reporting tools like Power BI, Tableau, Excel or anything which can use [ODBC](https://en.wikipedia.org/wiki/Open_Database_Connectivity)
* [External reporting (read-only access to data)]({{<relref "/docs/charting/business-intelligence">}})

## Incoming Data

Users are able to add data:
* Via the User Interface
* Import CSV files

Third parties can save data into agilebase:
* Via the POST API

## Testing and debugging APIs

### Viewing logs
1) Open the API view and toggle the development mode on
2) From the panel sidebar, choose 'use API' and scroll down to Logs

The most recent API actions and any errors which may have occurred will be shown

### Showing the internal ID of each record
Sometimes it can be useful to see the internal ID (primary key value) of each record the API acts on, to match up with info from the third party system you're integrating with. To do this, see [Accessing additional debugging information]({{<relref "/docs/introduction/development-mode#accessing-additional-debugging-information">}})