---
title: "Setting up the Calendar API"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 110
description: A powerful automation feature that can synchronise data with a third party calendar.
tags:
- Certified Architect
---

If a view contains a date field, the data in it can by synchronised with an external calendar application, e.g. Google Calendar, Microsoft Office 365, Apple calendars etc.

If it contains two date fields, the first will be used for the start date/time, the second for the finish.

Once set up, the link will be maintained and the calendar will update whenever the data in agileBase is updated, or vice versa. The synchonisation can be set up to be two-way (to and from agileBase), or just one way (either two or from agileBase)

## Pre-requisites
agileBase uses [OAuth](https://oauth.net/), an industry standard protocol, to synchronize with your calendar system of choice.

Under this protocol, each person will need to individually grant agileBase permission to send data to, and view events in their calendar. This is a straightforward process: as a user,
1. Click on your user icon at the top right of the screen
2. Select _edit profile_
3. Click the _connect calendar_ link

You will see a calendar selector screen like this:

![Cronofy](/cronofy.png)

Choose the calendar system you use and follow through the prompt to allow access.

## Incoming data
Once users have connected their calendars, data can be received into agileBase whenever an event is created, edited or deleted in the external calendar. We need to set up two new tables so the system can receive these events. One is a table for the event data itself, the other stores the list of calendars in the user's account. One calendar account may contain multiple calendars, e.g. a user may have separate calendars set up for bookings, sales visits, holidays etc. - typically they display in different colours on the screen.

The main reason for recording the calendar list is so that the correct calendar can be chosen to send events to, when we come to send events from agileBase (see below).

To set up these tables, follow this process:

1. Create a table called `ab calendar intray`. It can have a prefix if you like, e.g. `z) ab calendar intray`
2. Add the following **text** fields: `person`, `calendar id`, `calendar name`, `event id`, `summary`, `description`, `location`, `participation status`, `event status`, `categories`, `attendees`
3. Add the following **date** fields: `start`, `end`, `created` (accurate to the second), `updated` (accurate to the second)
4. Add a **checkbox** field, `deleted`

and for the calendar mapping table:

1. Create a table called `ab calendar mapping`. Again, you can prefix it, e.g. `z) ab calendar mapping`
2. Add **text** fields: `username`, `calendar id`, `owner`, `calendar name`, `provider`, `profile id`, `profile name`, `permission level`
3. Add two **checkbox** fields called: `read only`, `primary`

The easiest way to understand the meaning of all the fields is simply to connect your calendar as above, create these tables and add some events to your third party calendar - create new events, update them and delete them, watching the data flow into the tables. New data will usually take no more than a few seconds to appear.

> Different third party calendar systems may use some fields in slighlty different ways. For example, at the time of writing, Google Calendar does not support the `categories` field but some other calendar systems do use this to show tags you may have added to your events.

Once you have data successfully flowing into the system, a common next step is to move the incoming events into tables which make sense for your particular business needs. For example, if you have a team of salespeople, you may move incoming bookings into a 'leads' table. What you do with the data will depend on your particular circumstances.

You can use [automated worflows]({{<relref "/docs/workflows">}}) to copy data from one table to another if necessary.

However, you could also simply create views from the 'ab calendar intray' table to allow users to view these events directly. Adding a filter to the user on the 'person' field will ensure a user will only see their own events -see [users - restrict data access]({{relref "/docs/security-and-compliance/security-features/users#restrict-data-access"}})

> Please be aware of potential data privacy concerns when setting up calendar synchronisation. All events a user creates or modifies in any of the calendars in their connected account will send to agileBase. As an administrator, you may wish to set up specific work calendar accounts for your users, distinct from any personal accounts they may use.

## Outgoing data
As well as receiving data in, you can send either new or modified events from agileBase to users' connected calendars.

New events are those created in agileBase, modified events are those created externally which have come into the system via the incoming data method above, but which have then been updated in agileBase.

To set this up
1. [Create a view]({{<relref "/docs/views">}}) to show the events to send to the calendar.
2. Add any relevant [filters]({{<relref "/docs/views/filters">}}) to the view, so it only shows events which need to be sent, not **all** events.
2. In the view's _manage_ tab, show the _Send_ panel. Select _send data to an external calendar_
3. Tick _Send events to calendar_ to activate the view and add the fields shown. These are
    - **text fields**: `calendar id`, `event id`, `calendar owner`, `title`, `description`, `location`, `attendees`
    - a **whole number field**: `reminder minutes` - a number of minutes before the event when the calendar should alert you
    - two **date fields**: the first date/time field in the view will be used as the event's start date/time, the next the end date/time (if applicable)

Some of these fields deserve additional explanations:
* **calendar id**: identifies the particular calendar within the user's connected account to send events to. This is the same calendar ID used in the 'ab calendar mapping' table above, so can be looked up from there, perhaps by joining to the table.
* **event id**: if you're creating a new event, leave this blank. If the event was created externally, or you're updating an existing event, use the event ID as listed in the 'ab calendar intray' record for it.
* **calendar owner**: the ID of the agileBase user - this will be used to determine the person who'se linked calendar the event should be sent to. The standard agileBase format is used 'Forename Surname (username)', so you can use the automatic field 'Created By [auto]' if you like.
* **attendees**: a comma separated list of email addresses of people who should be invited

