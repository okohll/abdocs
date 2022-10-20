---
title: "Business Intelligence"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Visualising data in third party Business Intelligence tools
tags:
- Junior Software Architect
- v6
---

> Before setting up a BI connection, please be aware of the [data privacy and security](/docs/charting#privacy-and-data-security) considerations.

Any tool which utilises [ODBC](https://en.wikipedia.org/wiki/Open_Database_Connectivity) can be used, such as Excel for example. Power BI is a common one.

## Initial Setup

The first step is to [contact us](https://agilechilli.com/contact-us/) to request we prepare your account. This will also allow connections from Power BI or any other tool which can connect to ODBC).

If you use Power BI, then the process is as follows
1) Install the PostgreSQL ODBC driver from https://odbc.postgresql.org/. Use the Downloads link and if running on Windows, use the newest driver from the **msi** folder.
2) Use your operating system's control panel to set up the ODBC driver, using the login details we supply. Ensure the SSL mode is set to 'require'.
3) From Power BI, add a connection using the PostgreSQL ODBC driver, *not* the built-in Power BI PostgreSQL driver.

## Sending data to Power BI

A developer with MANAGE privileges on a view's parent table can set this up.

1) In Agilebase, open the view you wish to report on. Ensure it has all the necessary fields and calculations in it which you want to report on. If not, add them before continuing.
2) Click the charting icon to view the chart setup interface
3) At the bottom of the screen, tick 'send data to a shareable dashboard'. As this makes data available [outside of Agilebase](charting#privacy-and-data-security), you will be asked to confirm you will treat the data in a way which maintains privacy and security before enabling the feature.

Within a few seconds, the data will then be visible to your external application.

> The first view set up in this way is free, further views can be purchased in bundles.

### Changes
It's easy for developers to make changes to views in Agilebase, for example adding / removing fields, changing calculations or just renaming a view.

> However, when the BI connection is active, bear in mind that certain changes could break it. The reason is that once data is set up to transfer to a separate system, the other system typically expects it to remain in the same format.
>
> That means that if you rename the view or move it, or rename/delete fields and calculations, you may afterwards need to check your charts in Superset / Power BI, to see if they need re-creating.

### Daily updates

Once the view has been set up, external applications will see a new read-only snapshot of data once a day. If your data needs to be updated more often, you can add a workflow button to accomplish that:
1) Ensure that the view A is used for reporting only, in particular it doesn't have any [workflow]({{<relref "/docs/workflows">}}) set up.
2) From another view B, edit the view and go to the 'workflow - edit records' panel
3) Under 'chain workflow', select the reporting view A

Then, when a user opens view B, they will see a button at the top of the screen with the button text set to the name of view A. Pressing it will refresh the view A data sent to external applications.
