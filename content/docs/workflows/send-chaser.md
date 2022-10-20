---
title: "Send a Chaser email"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 140
description: Chasers are dedicated functionality that use email to ask third parties for relevant information
tags:
- Junior Software Architect
---

The Chaser email facility is often used to remind people to send information. This facility is a dedicated tool, optimised to this purpose.

In a nutshell, the system comprises three parts

1) checking when something’s due and emailing the person who needs to supply it

2) allowing the recipient to easily provide the data by following a link in the email to an online form. Documents can be uploaded and other information filled in

3) if no response is received, re-sending a number of times, finally escalating to someone else (usually someone internal)

![Screenshot of Chaser user interface](/chaser2.png)

## Example
The system can be applied whenever you need a third party to supply you with information or documents of a known type.

For example, a food manufacturer who receives ingredients from suppliers may occasionally need to raise a non-conformance where something isn't up to standard.

Whenever a non-conformance is raised against a supplier, whether as a result of an audit or ad hoc, the supplier can be chased for information about a resolution of the issue. Likewise, staff can be chased if an internal non-conformance is not resolved.

## Setup

As an Agilebase administrator, if you want to set up your own chaser, here’s how to do so. 

1) Create a view with a list of people to chase. In the view’s _manage_ tab, under _Send_, choose _send email chasers_

2) Tick 'enable this chaser'

The system will add a number of calculations to the view and a couple of fields to the underlying table, to help manage chasing. These will be listed on the screen after ticking 'enable this chaser'.

Please edit the calculations to fill in the details required, such as the email address to send messages to, the frequency with which to send messages etc.

3) Now make sure that only things you want to chase are chased, by adding any relevant filters to the view. e.g. to show anything out of date

That will be enough to get emails sending out. What about receiving the information back?

4) Simply add any fields you want the recipient to supply to the view, from the parent table.
 The system will automatically create a form containing these fields (excluding any of the chaser fields above such as ‘to’ and ‘subject’). When the recipient receives an email, it will have a link in it that takes them to this form.

If you want the content that the chaser sends out to be visible to users, add the chaser view into a form as a [referenced data field]({{<relref "/docs/fields/field-types/special-field-types/referenced-data">}}). The panel displayed to users will show information such as the email to be sent, how many times the record’s been chased, when the last time was etc. If the record doesn’t need to be chased it will instead show the reasons why (the filters from the view).

### Including attachments
If you add a file field to the view and a row being chased has a file uploaded to that field, it will be added to the outgoing email as an attachment.

Note if you add a file field from the view's parent table to the view and a particular record *doesn't* have a file uploaded, the chaser will request the recipient uploads one, when completing the form. In other words it will request a document.

#### Multiple attachments
Sometimes there may be a set of files you wish to attach to a single email, where the files are all stored in a child table. To accomplish this, join down to the child table and add the file field in that child table to the view.

Then, when there are multiple child records, each containing a file, those files will all be added to the outgoing email.

> Don't worry that the view then contains multiple rows per email. The chaser is clever enough to only send one email, but merge in all the files from the multiple rows.

### Receiving a response
When a response is received to a chaser, as well as saving the documents / fields the chaser asked for, a comment will be logged to the first comment field in the parent table (if there is a comment field).

An email will also be sent to a user notifying them of the response. The logic for who to send that notification to is:
1) If there are any dropdown fields in the table with the option [fill with users]({{<relref "/docs/fields/field-options/text-field-options#lists-of-users">}}) then send the email to the user selected in that field. If there's more than one field with that option, use the first one.
2) If there are no fields with 'fill with users' selected, fall back to notifying the user who last updated or created the record being chased.

### Sending thank you emails
When someone completes the chaser form and provides the information requested, a thank you page will be shown. If the value of the *send thanks* calculation in the chaser form is *true* for a row, then the recipient will be sent a thank you email as well.

#### Optional response fields

The following fields can optionally be added to the table. If they are found, they will be populated by the chaser system when a chaser response is received.
1. **chaser response received**: if a *date* field with this name exists, the value will be set to the date and time of the response
2. **chaser response needs checking**: if a *checkbox* field with this name exists, it will be ticked when the response is received

### Errors
If an email can't be sent because of an invalid address in the 'To' field, then the address specified in the 'Escalate To' field will be notified.

### Using multiple chasers on the same table

[TODO]
