---
title: "Data Integrity Checks"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Enforcing the correctness of data entered into the system
tags:
- Architect
---
It can be important to ensure that certain rules are followed when data is entered, either manually by a user, by an incoming [API request]({{<relref "/docs/integrations">}}) or someone filling in a [chaser]({{<relref "/docs/workflows/send-chaser">}}) response.

> When designing applications, just be aware there is sometimes a trade-off between the ideal of data integrity and everyday concerns.
> 
> For example, you may like to force users to always provide an email address for contacts but in a small minority of cases, they may not have that available.
> 
> Agilebase has options for handling soft validation (highlighting errors or notifying someone) as well as the hard validation (disallowing invalid data entry) options discussed here. For example, you could
> * [Create a view]({{<relref "/docs/views">}})to show all records with errors, for later checking
> * Set up a workflow or chaser to [chase someone]({{<relref "/docs/workflows/send-chaser">}}) when errors are found
> * Use the [API]({{<relref "/docs/integrations">}}) to send a message to your internal messaging system e.g. Slack

That said, these are the ways in which you can strictly enforce data integrity.

## At an individual field level
Basic rules can be applied with [field options]({{<relref "/docs/fields/field-options/common-options">}}). For example a field may be set as mandatory, or it must contain unique values (no duplicates).

## Advanced field checks
1. Expand the _Build Tables_ menu in the lefthand sidebar
2. Select the table you wish to add rules to
3. Click the pencil icon in the toolbar to edit the table, then select the table's _manage_ tab
4. Click the _Checks_ button

Here you can add more complex checks, such as the value must be longer or shorter than a certain length, be within a date range or match a [regular expression](https://en.wikipedia.org/wiki/Regular_expression). The list of checks available is the same as that used in [view filters]({{<relref "/docs/views/filters">}}).

![Field checks](/field-checks.png)

## Multi-field unique constraints
Access these with the _Unique_ button under the _Checks_ button.

Sometimes, fields must be unique **in combination**. For example, imagine you have a system for recording customer complaints. One of the fields might be a customer's reference number, another a relation to the customer record.

You want to avoid duplicates being entered, so could make the customer reference number unique. However it could be that two different customers could use the same reference number independently, so that wouldn't really work.

The solution is to add a multi-field unique constraint on customer and customer reference number. That way, a reference number won't be able to be re-used for a complaint from the same customer, but more than one customer is allowed to use the same reference.

