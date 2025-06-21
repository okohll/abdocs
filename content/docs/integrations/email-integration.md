---
title: "Email Integration"
date: 2025-06-20T17:54:00+01:00
type: docs
weight: 200
description: Importing emails into Agilebase
tags:
- Software Architect
- v6
---
Agilebase can accept incoming emails and attach them to relevant records e.g. attaching an email from a customer to that customer's record.

This works by creating an email address for the system. Any emails forwarded to that address, or cc'd or bcc'd to it will be saved in the database. Agilebase will check the people involved in the email (to:, from: and cc: addresses) and find the right record to attach it to.

You can set up multiple addresses for different purposes, so you could have one to log emails sent or received regarding sales opportunities to the sales record, and project related emails.

There are two ways an incoming email can be handled
1) attach it as a comment to a record
2) create a new record for it in the tab of a parent record

As an example of 1, if an incoming email is about a sales enquiry, it could be logged against that enquiry in the record's comment stream, so a history of conversations can be seen.

Alternatively, using 2, each incoming email could create a (potential) task or todo under the sales enquiry, to be assigned to someone.

In either case, the text contents of the email are recorded as a [comment]({{<relref "/docs/fields/field-types/special-field-types/comment-feeds">}}). The full email including attachments and previous messages in the thread is also made available from the comment, to be downloaded if necessary.

# Setup

## To send emails directly to a comment field in a table
1) Contact us to set up an email address to direct emails to
2) Identify the table to which emails should be added to. Edit that table and in the options, enter that email address into the *Accept emails to this address* field.
3) Create a view from that table to look up relevant email addresses for. For example, if the table is for sales enquiries you might want to create one which contains the email addresses of all contacts for the organisation the enquiry is for.
    > The email address field used must be a text field have one or more of these options ticked: 'use in title'; 'required'; 'prominent'; 'unique', or be a calculation which references a text field which does.
    > The name of the field doesn't matter, it doesn't have to have the word email in it for example
4) In that view, go to the *use API* and tick 'allow incoming email'
5) Name the view to match the part of the email address in 1 before the @ sign. If the email address is contactimport@mycompanyname.agilebase.co.uk, then the view's name must be 'contactimport'
   > The view can be in any menu, that part of the name doesn't matter

## To make each incoming email create a new record in a child table
Do all of the above steps first. When the instructions refer to the table, this means the *parent* table, i.e. the table you want new child records to be attached to

1) Create or select a child table to accept emails. A new record will be created in this table for each incoming email
   > The child table must include a relation field pointing to the parent table
2) Ensure there is a [tab]({{<relref "/docs/tables/hierarchy-navigation/tabs">}}) for that child table in the parent table
3) Edit the tab options and tick 'accept emails from parent table'



