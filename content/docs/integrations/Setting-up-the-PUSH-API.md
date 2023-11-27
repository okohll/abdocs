---
title: "Creating a PUSH API"
date: 2020-06-01T16:40:00+01:00
type: docs
weight: 130
description: A powerful automation feature that can send data to third party systems.
tags:
- Junior Software Architect
- v6
---

1) Firstly, create a a view which contains the data you wish to send
2) In the 'Use API' panel, enter a URL into the _Push URL_ field. This is the URL that Agilebase will POST to when there’s new data.
3) In the table that the API view was created from, add a new date/time field, accurate to the second, for the system to record when the API push was last used
4) Go back to the view and the 'Use API' panel and select the field you just created for the 'Log Time Of Push To' field.
The system will now make a POST to the URL specified in step 2 whenever there’s new data to send. It will contain one parameter, ‘json’, which is a JSON representation of all the data in the view.

![Configuring the PUSH API](/workflow-push-new.png)

### Selecting data to push

How do we know which data is new and wants to be sent out via the API?

That’s up to you - any filters can be added to the view to select data you want. Commonly, you’d use the date/time field set up in step 3. When a push successfully completes, every record in the view has this field set to the current time.

> Note: if the push encounters an error for any reason, say the third party system returns a HTTP error code rather than the expected ‘200’ code for success, the timestamp won’t be set.

A few common scenarios would be:

#### Pushing any data modified since it was last pushed
To do this, add a boolean calculation to your view, something like

needs pushing = `{last modified [auto]} > {last pushed}`

where ‘last pushed’ is the name of the timestamp field you added in step 3 above.

Then add a filter on the view ‘needs pushing equals true’.

#### Pushing any new rows that have never been pushed before
For this scenario, simply add a filter to the view ‘last pushed is empty’.

#### Pushing only rows not yet marked as received
In some cases, you may want to be even more prudent than using the internal timestamp. The third party system could make a separate API call to Agilebase for every row that’s received, telling it to update the row with an ID to prove receipt. That’s more API calls of course, but some situations may warrant it.
