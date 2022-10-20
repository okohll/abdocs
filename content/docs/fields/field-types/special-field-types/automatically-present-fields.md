---
title: "Automatically present fields"
date: 2020-05-08T16:40:00+01:00
type: docs
weight: 100
description: Metadata fields created and managed by the system
tags:
- Architect
---
When every [table]({{<relref "/docs/tables">}}) is created, a series of fields are automatically added. These aren't displayed in the data entry form of a table, but are available to be added into views.

## ID field
In database parlance, the table's [primary key](https://en.wikipedia.org/wiki/Primary_key) - providing a unique ID to identify each record. Values are generated in sequence.

Agilebase creates and manages primary keys, using them to link related tables together automatically, however it's useful for administrators to understand the concept and implementation. Many platform features depending on including the ID field for a particular table in a view, such as [referenced fields]({{<relref "referenced-data">}}).

## Creation Time [Auto]
The record's creation time, accurate to the ms and displayed to the second by default.

## Created By [Auto]
The user ID of the person who created the record, in the form `Forename Surname (username)`. 

> This format is used to identify a user everywhere in Agilebase, for example when assigning a record to a user. When a user ID identifies a person in a [chaser]({{<relref "/docs/workflows/send-chaser">}}) or [email workflow]({{<relref "/docs/workflows/send-email">}}), Agilebase will look up and use their email address, from their account details.

When a record is created by a workflow, the Created By will be `System User (system)`.

When created by an API call, it will be `Public API (IP Address) (public api`, where the IP address of the calling system is recorded.

## Last Modified [Auto]
The record's last modification time. Behaviour is similar to Creation Time [Auto], above.

## Modified By [Auto]
The user ID of the person who last updated the record. Behaviour is the same as Created By [Auto].

## Locked [Auto]
A boolean value which is true if the record has been [locked]({{<relref "/docs/tables/options#records-lockable">}}) by a workflow, to disallow further editing.

## View Count [Auto]
How many times a particular record has been opened or viewed by a user. A measure of popularity if you like.

## Activity Histogram [Auto]
The activity histogram of a record shows the relative activity of each record, i.e. the number of record edits that have occurred, over a period of time. It's displayed as a small [sparkline](https://en.wikipedia.org/wiki/Sparkline) chart.

The activity over the past six months is shown, one point, or 'spike' per week. The more edits in a week there are, the higher the spike. Edits to 'child' records in a tab of a main record are also counted, but contribute relatively less.

> As an example of use, in a display of sales opportunities, you want to know which opps. are being actively worked and which haven’t had any activity for some time. The activity histogram shows the ‘shape’ of activity over a period of time, at a glance.

With sparklines next to every record on screen, you can quickly get an idea of the relative activity of each.

![activity histogram](/activity-histogram.png)

## Comments Feed [Auto]
This field contains an amalagamation of all [comments]({{<relref "/docs/fields/field-types/special-field-types/comment-feeds">}}) added to a record, newest at the top. Adding this field to a view allows recent comments to be seen for many records at once and is an easy way of making record comments searchable. As opposed to the [comments tile]({{<relref "/docs/tiles">}}), the user sees all record comments, not just those they are a recipient for, but only those for the table in question.

Note - the Comments Feed [Auto] field combines comments from all comment fields in the table, if there's more than one, as well as any comments added to other fields.

## Document Storage (MB) [Auto]
Shows the amount of storage used for all documents attached to a record (uploaded or generated), including previous versions. Adding this field to a view allows you to total up storage across all (or a subset of) records.
