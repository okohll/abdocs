---
title: "Charting"
date: 2021-11-05T11:40:00+01:00
type: docs
weight: 70
description: Data visualisation options
tags:
- Citizen Developer
---
In Agilebase there are two mechanisms for charting and visualising data, each suited to a different purpose
1) our [built-in charting](built-in-charting)
2) exporting data to third party business intelligence tools

If you're starting out, we recommend beginning by looking at built-in charting.

For more advanced users, here's a description of when each of the two options may be appropriate, with reasons why.

## Built in charting
This should be the default starting point. It's great for ad-hoc charting, i.e. to get quick answers to questions you may have about the data in the view you're looking at.

Charts can be easily created, modified and removed. People with MANAGE privileges on a table can create charts that all users will see, lower privileged users can create charts that only they see.

Creating charts can be used in conjunction with building views, in an agile fashion. For example, if you're looking at a view of invoice and want to see a breakdown of totals for the year by customer type, but the customer type field isn't in the view, no problem. Just
1) add the customer type field to the invoices view
2) create a chart to total up values by customer type

Developers can also choose to have certain charts emailed to different groups of people on a regular basis. For example, [TODO]

## Exporting to Business Intelligence
We provide our own business intelligence tool, an instance of Apache Superset, which is available at https://superset.agilebase.co.uk for easy setup 'out of the box', however any tool you wish such as Power BI can also be connected.

This may be useful when
* You want to report summary KPIs or trends upwards, to higher levels of management, so you need a dashboard
    * to include charts from different views in Agilebase in one place
    * to present them in particular formats suitable for reporting, e.g. in particular sizes/layouts or using company colours
    * potentially to include data from additional sources in the one dashboard e.g. from accounting systems as well
* The source data views in Agilebase are mature and aren't likely to change. Changes can break any integration set up
* You are happy with the privacy and data security implications - see below

### Privacy and data security
When connecting a Business Intelligence tool, whether that's the Superset instance we provide, or a third party tool, it's important to realise that data *leaves Agilebase* and therefore is no longer protected by Agilebase's roles and privileges system.

You may have data in Agilebase which is only accessible to certain members of staff, however when accessed outside of Agilebase, those rules no longer apply. That doesn't necessarily mean the data is accessible publicly, but it does mean it's controlled by whatever privilege system the third party tool uses, which will be different to Agilebase's.

Therefore, from Agilebase's point of view, similar rules will apply when connecting a BI system as to when exporting data to spreadsheets. For example
* Any user connecting a BI tool will be shown a warning of these consequences, which they'll need to accept prior to going ahead
* Agilebase system administrators will get email notifications every time data in a view is made available to BI tools, containing information on whether that data is marked as sensitive or private
* Only people with MANAGE privileges on a table can connect BI tools. They also have to have two factor authentication enabled

