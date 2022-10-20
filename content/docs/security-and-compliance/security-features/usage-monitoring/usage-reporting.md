---
title: "Reporting"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Viewing, querying and reporting on log data
tags:
- System Owner
- Architect
---
Log data reporting provides a rich view of system usage.

## Enhanced audit trail
For organisations who have activated the enhanced audit trail, all logs are stored in user-accessible tables which are just like any other tables in the system, the only difference being the data is read only. This means an administrator can use the full power of the built in Agilebase reporting features, to create views, add calculations, charts etc., even export via the API.

So for example, you could analyse how many changes were made per month by each user, count the volume of logins from various locations or see what the most common fields are to search on. All actions listed on the [usage monitoring]({{<relref "usage-monitoring">}}) page are available to query.

Data is also retained for an extended period, see [retention periods]({{<relref "usage-monitoring#retention-periods">}})

If interested in activating this feature, please [get in touch](https://agilechilli.com/contact-us/). There will be a small recurring charge added to your bill.

### Data stored
#### Logins
* Username
* Date and time
* IP Address
* Country
* Internet Service Provider organisation name and location
* Client web browser (both summary and exact version details)
* Client operating system

#### Data changes (record creation / update / delete)
* Username (in the case of an API call, will be 'Public API [IP address]'. In the case of a system workflow, 'System')
* Date and time
* Action (e.g. update or delete)
* Table
* Field (if a single field is updated)
* Row ID - internal identifier of the record updated
* Saved data

#### View access
This covers any time a view is opened or filtered, either by a user, or an API call
* Username (in the case of an API call, will be 'Public API [IP address]')
* Date and time
* Tile and view name
* Details - any filters and row limit applied
* Rows - the number of records returned to the user or API
* Processing time - the total server-side processing time in milliseconds needed to retrieve the data, and if for an API, transform it into JSON format
* Of which Q time **(API calls only)** - to achieve a fair level of load balancing, Agilebase operates a separate API request queue for each customer. If a request arrives and the system is still busy processing a previous request, the new one gets held in a queue. This field shows how much of the total processing time, in ms was spent waiting for previous requests to complete
* Bytes **(API calls only)** - the number of bytes of JSON data returned via the API
* Count - if many similar requests or API calls (to a particular view) reach the server in quick succession, they will be amalgamated together into one log line. The count then shows the number of requests the log line refers to, otherwise it will be 1. If more than one, then the *rows*, *processing time*, *of which q time* and *bytes* will represent the totals for all requests

#### Table schema changes
These are changes made to a table structure by someone with [manage]({{<relref "../privileges">}}) privileges, such as adding or removing a field.
* Date and time
* Username
* Table name
* Action e.g. 'add field', 'remove field'
* Details - e.g. the name of the field

#### View schema changes
Changes made to a view structure, such as adding fields, filters, calculations or charts
* Date and time
* Username
* Tile and view name
* Action
* Details - additional data related to the action, e.g. if adding a field, the field name

## Authentication changes
A log of administrative actions such as assigning a user to a role, assigning privileges, or user actions such as requesting a password reset
* Date and time
* Username (of the user making the change)
* Action - e.g. add privilege
* Table name - only if the action relates to a particular table, e.g. assigning a role to a table
* Details - additional data related to the action, e.g. if adding a role to the table, the role name

## Standard reporting
Built in reports are available in a number of areas, whether using the enhanced audit trail or standard logging.

### The dashboard
From the tiles interface, click the bird icon at the top left, then select _usage dashboard_. The dashboard contains system reports including usage data.

#### Trends
An overall usage treemap is displayed at the top. Each view is a section of the screen. Large areas represent views that get a lot of use, smaller areas those that don’t. Colours give immediate feedback on whether usage has been increasing (blue) or decreasing (grey) this month. Hovering over an area shows more stats including the top users.

Underneath that a series of sparkline charts show long term trends, across selected operational, tactical and strategic metrics, all geared to showing utilisation over a 12 month period.

Raw data can be downloaded to spreadsheet using the links beneath each sparkline. Note only the most recent 200,000 records can be downloaded in this way.

#### Capacity
As well as actual usage, the dashboard shows total capacity i.e. how many users, records, tables etc. are present in the system, along with purchased capacity (if relevant). These elements affect billing.

#### Workflows
A convenience view of all workflows which carry out automated data modifications, see [workflows]({{<relref "/docs/workflows">}})

#### Database graph
Finally, for background on what the data structure looks like and how tables are connected, the database graph shows relations between tables is visual form. This can provide a fuller understaning of the system.

### Table and view usage
A quick overview of who is viewing data is shown in the administration interface for both tables and views.

For a table
1. Open a table, under the _Build Tables_ section of the lefthand navigation
2. Go the the manage tab and click the _Usage_ icon

The report shows the number of times each user has viewed data from the table, per view. All views which contain any data from the table are included.

For a view
1. Open a view from the lefthand navigation
2. Go to the manage tab and click the _Usage_ icon

Similar data is show as for tables, but limited to the selected view.

## Individual record histories

Any user can see the complete history of changes to an individual record, up to the [retention period]({{<relref "usage-monitoring#retention-periods">}}).

When editing a record, scroll to the bottom of the screen and click _history_.

To view the precise time of a change, hover over a date.