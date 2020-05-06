---
title: "Reporting"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Viewing, querying and reporting on log data
---
Log data reporting provides a rich view of system usage.

## Enhanced audit trail
For organisations who have activated the enhanced audit trail, all logs are stored in user-accessible tables which are just like any other tables in the system, the only difference being the data is read only. This means an administrator can use the full power of the built in agileBase reporting features, to create views, add calculations, charts etc., even export via the API.

So for example, you could analyse how many changes were made per month by each user, count the volume of logins from various locations or see what the most common fields are to search on. All actions listed on the [usage monitoring]({{<relref "usage-monitoring">}}) page are available to query.

Data is also retained for an extended period, see [retention periods]({{<relref "usage-monitoring#retention-periods">}})

If interested in activating this feature, please [get in touch](https://agilechilli.com/contact-us/). There will be a small recurring charge added to your bill.

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
A convenience view of all workflows which carry out automated data modifications, see [workflows](https://todo.com)

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