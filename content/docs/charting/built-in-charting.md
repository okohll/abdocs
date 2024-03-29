---
title: "Built In Charting"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Building and working with charts
tags:
- Citizen Developer level 1
- v6
---
Charting is not strictly an administrator function, as any user can create charts and other data visualisations, such as maps and word clouds.

However, it's useful for administrators to know how the system works in outline, so they can support users and also because creating charts may be a key part of building an application.

In Agilebase, charts 'belong to' a view. Each view can have a collection of charts. Users can toggle between viewing data rows and looking at charts based on those rows. When a user filters data using the quick filter boxes at the top of the screen, the data or charts (whichever is shown) will update to match the filtered results.

## Creating a chart
1. In the tiles interface, open the tile and view to use as a source of chart data
2. Click the charts button at the top right of the screen
3. Click the _add/edit chart or map_ button
4. Follow each of the steps (1 - 3) on screen to build the chart
5. In the last step, give a name to the chart and press _save_

When choosing a type of chart in step 3, small previews will be displayed based on some of the chart data. However some chart types may display a message rather than a preview. In this case, the chart data selected in step 1 is not applicable for this chart type.

For example, if in step 1 we have a count of items per year:

![Chart - step 1](/chart-1.png)

then the scatter diagram will work but the bubble chart won't. For the bubble chart, **two** y-axis measurements are required, one to specify the position of the bubble on the y-axis, plus another to determine the relative size of the bubble.

![Chart - step 3](/chart-bubble.png)

## Embedding charts in forms
Charts can be embedded into tables. When the user opens a record, the chart will automatically filter to show data pertaining to that record only. 

So for example if you have a chart of sales per month per customer, which you embed into a customer table, it will show as sales per month, only for the customer on screen.

This is accomplished by using a view with chart(s) as a [referenced data field]({{<relref "/docs/fields/field-types/special-field-types/referenced-data">}}) - see that page for setup information.

## Embedding charts in tabs
When a tab contains many 'child' records, e.g. an organisation may have a tab which contains financial data for the past 10 years, then charts can display above the rows of data when the tab's opened.

To accomplish this, simply add a chart to the [view used by the tab]({{<relref "/docs/tables/hierarchy-navigation/tabs#tab-view">}}). When the tab is opened, the chart will automatically be filtered to only show data pertaining to the parent table, in a similar fashion to how charts embedded using cross-referenced panels are filtered, as above.

![Endole example](/endole-example.png "Example of a chart in a tab")

## Subscribing users or roles to charts
Users can be subscribed to charts (or subscribe themselves) to receive them by email.

1. In a view with some charts, open the charts
2. Next to 'Send these charts to me', select a frequency, e.g. monthly.
3. Under 'Include data too', select tabular data to include in the email too - various options will be displayed e.g. all new rows since the last email
4. Next to 'roles', select a role to send the charts and data to. All users in the role will be subscribed. Multiple roles can be added

> If the view has no charts, this function can be used to send tabular data only
