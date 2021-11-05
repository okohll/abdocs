---
title: "Charting"
date: 2021-11-05T11:40:00+01:00
type: docs
weight: 70
description: Data visualisation options
tags:
- Super User
---
In agileBase there are two mechanisms for charting and visualising data, each suited to different purposes
1) built-in charting
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
This may be useful when
* The source data views in agileBase are mature and aren't likely to change. Changes can break any integration set up
* You want to report summary KPIs or trends upwards, to higher levels of management, so you need a dashboard
** to include charts from different view in agileBase in one place
** to present them in particular formats suitable for reporting, e.g. using company colours
** potentially to include data from additional sources in the one dashboard e.g. from accounting systems
* You are happy with the privacy and data security implications - see below

