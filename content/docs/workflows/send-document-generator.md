---
title: "Send to Document Generator"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 160
description: Workflows can be used to automatically create a PDF document based on a template
tags:
- Certified Architect
---

## Automated bulk document generation
Automatically generating PDF documents based on criteria you specify is a powerful feature.
For example, if your system tracks exam marks, you may wish to automatically generate a certificate whenever someone passes. Another more common example might be generating invoices for all work carried out this month.

## Setting up

The concept works much like email notifications or syncing events to Google calendar. A view must be set up that contains the records that you want to generate documents for.

1) The first step is to set up and upload a template as per [generating PDF documents]({{<relref "/docs/fields/field-types/special-field-types/file/document-templates">}})

2) Add a date field to the table that contains the document file field, for the system to record the time each document was generated. For the purposes of these instructions, we’ll assume it’s called _document generation time_

3) Create a new view to contain only records that need documents generating, e.g. with a filter added to remove any records that already have a document

4) In the _manage_ tab for the view, within the _send_ section set to _Generate PDF documents_. Select the date field that you created in step 2 above, i.e. ‘document generation time’

That’s it. Now whenever a record appears in the view, a document will be generated. Note this generation may take up to 10 minutes from the time the record appears in the view to allow for the fact if a record’s being edited, we want to make sure all information has been captured that may go into the document template.

![Workflow setup to generate a PDF document](/send-document-generation.png) 

## Automatically emailing documents as attachments
Once your system is generating documents automatically, you can set it up to email those out to people as attachments, also automatically without any user input. That’s great if you’re processing a large number of documents, for example invoicing hundreds or thousands of people per invoice run – it could be quite a time saver.

To set this up, create an automated notification as normal, to send an email to the intended document recipient. Just make sure that the body ‘template’ contains a reference to the field name of the document that you want to attach – the document field must be in the table that the notification view’s based on.

e.g. your template body could be
`Dear {forename},

Many thanks for your custom with us this month. Your invoice {invoice number} is attached.

Regards
XYZ

{invoice file}
` 

> Note – we recommend setting it up to send to someone within your organisation as a test, before switching to the actual recipient.