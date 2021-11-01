---
title: "Complete API worked example"
date: 2021-10-29T16:40:00+01:00
type: docs
weight: 165
description: A more complex API example showing a real world integration consisting of multiple steps
tags:
- Architect
---

Here's a great example of using an API to provide business benefits, that we use ourselves here at agileChilli. As well as outlining the steps necessary to set up the API, with links to other documentation pages where relevant, we also include other elements of the solution, like workflows and charting, which often form a part of integrations.

The scenario is that we want to be able to look up and store multiple years worth of financial data for any UK company we hold in our CRM system. It can be useful to be able to have this data to hand to aid sales, when considering partnering or when doing competitor/market analysis for example - see our [CEO's blog post](https://blog.agilebase.co.uk/2021/11/01/the-value-of-integrating-with-endole/) on the subject.

Firstly, we need to find a provider of this data who have an API - we use [Endole](https://www.endole.co.uk/).

We need to [create a table]({{<relref "/docs/tables">}}) to store the figures. We created a 'financial data' table containing the following fields:

![financial fields](/financial-fields.png)

The first field is a link to the organisation we're looking up financial data about.

The second is a text field which stores the date that figures are reported for. The reason that it's a text field is that our service, Endole, uses the format YYYYMM to represent the date, e.g. 202110 for October 2021. agileBase doesn't recognise this date format for incoming data via the API but not to worry, we can save it as text, then create a workflow in agileBase to transform it into an actual date as the data comes in. That's the next field and we'll cover the process below. This being a real example, we get to show this type of thing, which would be left out of a more theoretical case.

The bulk of the remaining fields are to store the particular figures we're most interested in and wish to receive from Endole.

Once that's there, we can add the financial data [as a tab]({{<relref "/docs/tables/hierarchy-navigation/tabs">}}) under the organisation.

So now we have the data structure fully set up in agileBase, but no figures to see. Let's get on and set up the integration with some API work.

This integration will comprise a three step process.
1. Send the company number for the organisation we're interested in to Endole
2. Use that number to look up the financial data for the organisation
3. Finally, send the information back into our financial data table, one record per year

## Setting up the API calls

The integration is relatively easy to set up using [Zapier](https://zapier.com). There's one Zapier action for each step in the process:

![Endole Zapier Overview](/endole-zapier-overview.png)

Each step is created using Zapier's Webhooks integration - this is a flexible, general purpose integration suitable for communicating with many different companies' APIs.

**Step 1** is what Zapier calls a 'catch hook'. It's a single purpose URL they will generate to allow you to push data to them. Once that step is created, we can create a matching workflow view in agileBase which contains the company number we wish to query Endole for. We created a simple view with just one field, the company number. We then turned on a [PUSH API]({{<relref "Setting-up-the-PUSH-API">}}) using the URL Zapier provided. That's as simple as pasting in the URL into the provided space in the agileBase view:

![Endole Zapier push link](/endole-push-url.png)

**Step 2** in Zapier queries Endole with that company number. Here's the meat of the process:

![Endole Zapier query](/endole-zapier-query.png)

Endole will come back with the figures for that company and in **step 3** we can send them to agileBase as a new 'financial data' record attached to the organisation, using a [POST API]({{<relref "Setting-up-the-POST-API">}})

![Endole Zapier details](/endole-zapier-details.png)

Note that the value for the Organisation relation field we mentioned in the start is given as an ID. This is the internal ID of the organisation which the company number belongs to. Zapier can find this as agileBase includes it in every push or pull API request as the 'id' parameter, whether we ask for it or not. It can be really useful for linking data in different tables together, as we're doing here.

> You may be thinking that this data looks like it represents one year's worth of financial data, but we want a full history covering multiple years. How do we get that?
> In short, we don't need to worry about it. Endole provides the data to Zapier as an array, one entry for each year. Zapier transparenty handles that, sending one PUSH request to agileBase per entry.

Now we have everything we need regarding the integration! We could set the workflow to run in the background, so whenever a new organisation with a company number is entered into the CRM, the integration goes off and finds the financial data. However, because we have many thousands of organistions in our database, we want to be a bit more judicious about our use. Each API request to Endole costs only a small amount, but costs could add up if we were to automatically run it for every organisation, particularly if we include historical records.

So in this case, we'll add a 'retrieve financials' [workflow button]({{<relref "/docs/workflows/advanced/workflow-buttons">}}) to the organisation screen to kick off the workflow on demand. It looks like this on the screen:

![Retrieve Financials](/retrieve-financials.png)

## Final tweaks

Above, we mentioned creating a workflow to transform the YYYYMM date format (stored as text) into a proper date field. To do this we create a [workflow]({{<relref "/docs/workflows/altering-data">}} which will update our Date field. It contains a calculation called Date with the definition

```
to_date(
    {1.4) financial data.date representation},
    'YYYYMM'
  )
```

The workflow can be set to run whenever a financial details record is created, i.e. as data comes in, using the [run workflow on record creation]({{<relref "/docs/workflows/advanced/workflow-on-create">}}) option of a table.

## Charting the data

There's one more thing we can do to add some polish. When opening the financial details tab of the record, we can show a chart of the data for that organisation.

To do that, just add a chart to the [tab view]({{<relref "/docs/tables/hierarchy-navigation/tabs#tab-view">}}), with each metric you're interested in. When the tab's opened, the chart will automatically be filtered to show just the details for the organisation on screen.

Once complete, the screen will look something like this:

![Endole example](/endole-example.png)

