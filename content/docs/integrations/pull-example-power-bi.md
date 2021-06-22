---
title: "PULL API worked example - Power BI"
date: 2020-06-02T16:40:00+01:00
type: docs
weight: 160
description: A worked example showing how to send agileBase data to third party business intelligence software
tags:
- Architect
---
agileBase has built in charting which is great for quickly analysing and answering questions about data in your system, but specialist business intelligence apps can be particularly useful if you want to join data from multiple sources (perhaps an accounting package or marketing automation system too) in one place.

![Power BI](/powerbi.gif)

## Setting up
The below may look like lots of steps but that’s just because we’ve split it up into very small, simple parts to make it as easy as possible to follow.

### Step 1: set up a view in agileBase to use as a data source
> Use a view bringing in as many possible variables into one place. For example, if you want to analyse sales, you might include totals by customer, product, salesperson, region, category, price banding and date. That way you have plenty of dimensions to analyse in multiple ways later on.

### Step 2: turn on the API for the view to make data available
![Power BI - aB view setup](/powerbi-ab.png)

In the view's _manage_ tab, select the _send_ panel.

Select _send data to a third party system using the API_ in the dropdown list and make sure you tick _allow access from third party software using an API key_.

Refresh the view to show your API key needed for the next step.

### Step 3: within Power BI press _get data_ and select _Web_ as the data source.
![Power BI - web](/powerbi-web.png)

### Step 4: enter the sync details provided by AB into Power BI
Select the advanced option and fill in the following URL parts provided from the AB view setup in the first point. These are the parameters to add:

```
?get_report_json=true
&c=[your ‘c’ value here from AB]
&t=[your ‘t’ value here from AB]
&r=[your ‘r’ value here from AB]
&json_format=json
&simple_format=true
&row_limit=100000 [or however many rows you need]
```

![Power BI - web setup](/powerbi-web-entry.png)

### Step 5: enter the authorisation key into Power BI

Select _authorization_ from the dropdown options under ‘HTTP request hear parameters (optional)’ and press _OK_. The authorisation key is provided in the agileBase view.

![Power BI - auth setup](/powerbi-auth.png)

### Step 6: make data visible in Power BI

Once the data has pulled through and the connection is set up you will need to convert the dataset into a table.

![Power BI - convert to table](/powerbi-convert-to-table.png)

### Step 7: expand the colums
Once converted to a table you will then need to expand the data into columns and your view will be presented to manipulate.

![Power BI - expand](/powerbi-expand.png)

### Step 8: create your visualisations!

![Power BI - visualisations](/powerbi-visualisations.png)






