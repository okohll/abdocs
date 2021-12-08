---
title: "Business Intelligence"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Visualising data in third party Business Intelligence tools
tags:
- Developer
---

> Before setting up a BI connection, please be aware of the [data privacy and security](/docs/charting#privacy-and-data-security) considerations.

At agileBase we host an instance of [Apache Superset](https://superset.apache.org) which can be used by customers to create reporting dashboards.

However the setup processes below also applies to third party tools such as Power BI.

## Initial Setup

The first step is to [contact us](https://agilechilli.com/contact-us/) to request we set up an Apache Superset account (this will also allow connections from other BI tools). We will then set up as many Superset users you require - there is no ongoing cost for these login accounts.

Note that Superset logins are separate from agileBase ones - the usernames and passwords can be different.

## Sending data to Superset

A developer with MANAGE privileges on a view's parent table can set this up.

1) In agileBase, open the view you wish to report on. Ensure it has all the necessary fields and calculations in it which you want to report on. If not, add them before continuing.
2) Click the charting icon to view the chart setup interface
3) At the bottom of the screen, tick 'send data to a shareable dashboard'. As this makes data available [outside of agileBase](charting#privacy-and-data-security), you will be asked to confirm you will treat the data in a way which maintains privacy and security before enabling the feature.

Within a few seconds, the data will then be available in Superset.

### Changes
It's easy for developers to make changes to views in agileBase, for example adding / removing fields, changing calculations or just renaming a view.

> However, when the BI connection is active, bear in mind that certain changes will disable the connection. The reason is that once data is set up to transfer to a separate system, the other system typically expects it to remain in the same format.
>
> That means that if you rename the view or move it, or rename/delete fields and calculations, you may afterwards need to re-connect BI by repeating step 3 above. Additionally, check your charts in Superset, to see if they need re-creating.

## Creating dashboards in Superset

Now that you've set up agileBase to make data available to Superset, you can create charts and dashboards there.

1) Create a 'dataset' in Superset, corresponding to the view you set up above
    1) From the *Data* menu at the top, select *datasets*, then click the *+ dataset* button
    2) Under *Schema*, select your company name
    3) Under *Table*, select the name of the view that you set up above
    4) Click *ADD* at the bottom of the dialog (you may need to scroll down)
2) Create the chart
    1) Click *Charts* at the top, then *+ Chart*
    2) Select the dataset created above
    3) Choose a chart type, then *Create New Chart*
    4) Drag metrics (e.g. 'COUNT') and fields from the left into the appropriate areas in the middle column
    5) Click *Save* and Superset will prompt you to add the chart to a new or existing dashboard
2) Access the dashboard from the *Dashboards* menu at the top

For more details on creating charts and editing dashboards, including video walkthroughs, see [here](https://docs.preset.io/docs/create-a-chart)

> The first view sent to Superset is free, further views can be purchased in bundles.






