---
title: "Options"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Options which alter table behaviour
---
To access these options
1. Expand the _Build Tables_ menu in the lefthand sidebar
2. Select the table you wish to edit
3. Click the pencil icon in the toolbar to edit the table, then select the table's _manage_ tab
4. Click the _Options_ button

## Allow add
If this is ticked (it is by default), users can add records to the table. Anyone with manage privileges on the table can add tables regardless.

### Only from within tab
If this is ticked, users can add records but only when accessing this table's form from within a tab of a parent record. This can help ensure that child records are always connected to a parent and aren't created as 'orphans'.

## Allow clone
(Off by default). Show a clone record button when a user is viewing a record. This makes a simple copy of all data in the record. The contents of tabs are not cloned. A more advanced clone facility can be created with a [workflow](https://todo.com) if desired.

## Allow remove
(On by default). Allow records to be deleted by people with EDIT privileges as well as people with MANAGE privileges, who can always delete.

## Allow share
Showa button which allows links to individual records to be shared between users using email. Note - recipients still need a login and relevant privileges to see the record.

## When a record's created, run this workflow
Run a [workflow](https://todo.com) immediately after the creation of a record. The workflow runs after any field default values have been set.

### Run this workflow whenever each record is viewed
As well as running the workflow on record creation, also run it whenever a user views a record in this table. Be aware this may have a performance impact for users, if the workflow is resource intensive and/or multi-step.

## Data entry from external sources
The options in this section are for configuring the table to allow an API request from an external source to create and edit records. See [API use](https://todo.com) for more information.

## Other options
### Records lockable
Records can be locked to prevent editing. You may like to do this based on criteria e.g. once a customer order has been sent, it should be locked against further changes.

To actually lock the record, a [workflow](https://todo.com) can be used.

Locked records can be manually unlocked by someone with manage privileges on the table, but only one at a time.

### Email notifications
When someone adds a comment to a record, when selecting recipients, they have the option to email those recipients, as well as adding the comment to the [comment stream](https://todo.com). Ticking this table option sets the default to send emails for any comment added to this table. Users can override this on an individual comment basis and recipients can override in their notification preferences.

### Flag records with colour
Enter a field name here and add a field with the same name to a view, to flag records. The contents of the field must be one of the colour names as given on the screen. The field added to the view can be a calculation, specifically a hidden calculation. This will flag the view without showing the colour name on screen.

> It's also possible to colour individual table fields or calculations in a view (as opposed to this option which flags the whole row). See the options for [field colouring](https://todo.com) or [calculation colouring](https://todo.com)

### Accept emails to this address
The system can accept incoming emails and attach them to relevant records e.g. attaching an email from a customer to that customer's record.

A particular email address can be set up to receive emails. The system can be configured to either accept emails from anyone, or just from users. If just from users, then users can forward any emails they receive to the system to have them imported.

The email text will be logged as a [comment](https://todo.com) against the record, with the full email attached if it is HTML formatted or includes attachments. The table must have a comments field.

Please [contact us](https://agilechilli.com/contact-us/) if you'd like to set that up.

Emails are matched by creating a view containing the email addresses of potential recipients. An incoming email is attached to the record from this view which matches the sender's email address. If there is no match, it is added to a 'holding bay' where users can view and manually attach emails to records.

## Information
After the options, some structural information is shown, such as which tables depend on this one i.e. have a [relation](https://todo.com) to it, how many fields and views per tile there are. See also the [usage dashboard]({{<relref "/docs/security-and-compliance/security-features/usage-monitoring/usage-reporting#the-dashboard">}})

