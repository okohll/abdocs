---
title: "Setting up the Calendar API"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 100
description: A powerful automation feature that can synchronise data with a third party calendar.
---

If a view contains a date field, the data in it can by synchronised with an external calendar application, e.g. Google Calendar, a mobile phone calendar, Outlook or the iPad.

If it contains two date fields, the first will be used for the start date/time, the second for the  finish.

Once set up, the link will be maintained and the calendar will update whenever the data in agileBase is updated. The synchonisation is one way, i.e. updating agileBase will change the calendar view but you can’t edit the calendar to update agileBase. In other words, agileBase is the ‘master’ copy.

To set up a link, in the admin interface, go to a view’s manage tab, tick the checkbox to allow synchronisation and follow the instructions.



## Direct Google Calendar synchronisation
When people want to synchronise events to their Google calendars, we usually use the third party http://www.zapier.com who we have a built in integration with. They have a great service which allows you to push data to hundreds of other cloud apps, including Google calendars.

The only downside is that it’s a one-time sync only: once an event has gone across, any changes made in agileBase won’t be reflected in Google, say if the date/time or any other details of the event change.

To combat that, we’ve now made a more fully featured direct integration between the two services. With the new system, not only will changes made in agileBase synchronise to Google whenever an event is updated, but the event in Google will also contain a link back to the record that created it in agileBase. Just clicking on the event will take you to the right meeting, lead, sale, document or whatever created the calendar entry.

Updating an event in agileBase will trigger a push notification to Google calendar. This can happen between ‘immediately’ and up to ten minutes after the event (for demand levelling) but should take no longer than that.

 

How to set up a direct calendar integration

Firstly, contact us to enable the service. Although you’ll no longer need to pay Zapier integration fees, you will need to agree a contract that covers your usage as regular push notifications require resources and potentially Google fees. You will also need a ‘Google Apps for my domain’ account.

Once enabled, the configuration has a number of steps but is reasonably straightforward. If you like, we’d be happy to set up your calendars on your behalf as consultancy/support, please contact us if you’d like us to do this. If you’d like to crack on yourselves, here are the steps:

Add some necessary fields to the table
In the table that the events come from, create a text field called “Google Event ID” (the name needs to be exact). This will be used by the system to store internal IDs to help with the synchronisation process.
Create a date/time field (with accuracy SECOND) to store the synchronisation time. Call it something like “Last synchronised”. This will be used by the system to record when the event was last sync’d, also to help with the details of the process.
Set up a new view
Create a new view from the table. This view will be configured to show all events that need to be synchronised with a single Google calendar
We recommend creating a new module e.g. “Google Calendars” to store views that sync with Google.
Add a date field or calculation into the view. The first date field in the view will be used as the event’s start date
Optionally, add a second date/time field to be used as an end date. If you don’t, the end date will be set to the start date for whole day events, or the start date plus an hour for events with a time
Add a text field / calc to be used as the event title in Google
Optionally, add a text field / calc for the location. Any postal address recognisable to Google can be used. The simplest option is just to use a postcode.
Optionally add a text field for the event description
Finally, add the field “Google Event ID” that you created (see above) to the view
Add some filters to choose the events to sync
Typically, add a filter to hide events in the past. There’s not often any point in updating events which have already come and gone. Excessive updates may incur additional fees from Google.
e.g. Start Date newer than 0 days ago
Only show events which need to be created or updated in Google. Reference the “Last Notified” field you created in step 1. The easiest way is to create a calculation likeTo Sync (boolean) = {last notified} IS NULL OR {last modified [auto]} > {last notified}Then add the filter “To Sync = true”
This will ensure only newly created events, or events which have been modified since the last sync, will be included
Connect to a Google calendar
In the view’s manage tab, click Sync
Under Google Account Integration, type in your email address (this address must be associated with a “Google Apps for my domain” account. Refresh the screen
Under your email address, a dropdown list of your Google calendars will appear. Select the one you want to send events to and refresh the screen.
For the setting “Synchronisation time field”, select the field that you set up in step 1, e.g. “Last Synchronised”
Refreshing the screen will now show a list of which fields will be used for which parts of the event, e.g. start, location, description etc. so you can check all the fields are in the right order in the view
Finally, create a new record, wait up to 10 minutes then take a look at your Google calendar to check that it’s gone across! Note, when looking at the event details in Google, you’ll be able to click the agileBase source link which will take you directly to the original record.