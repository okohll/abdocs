---
title: "Send to Document Generator"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 160
description: Workflows can be used to automatically create a PDF document based on a template
tags:
- Junior Software Architect
---

## Automated bulk document generation
Automatically generating PDF documents based on criteria you specify is a powerful feature.
For example, if your system tracks exam marks, you may wish to automatically generate a certificate whenever someone passes. Another more common example might be generating invoices for all the work carried out each month.

## Setting up

The concept works much like email notifications or syncing events to Google calendar. A view must be set up that contains the records that you want to generate documents for.

1) The first step is to set up and upload a template as per [generating PDF documents]({{<relref "/docs/fields/field-types/special-field-types/file/document-templates">}})
2) In the same screen, choose a date field to log the time of each document generation. If no suitable date field exists in the table yet, you can add one by selecting 'create new field'.
3) Choose a frequency to run the workflow at, e.g. every hour

That’s it. Now whenever a record appears in the view, a document will be generated.

![Workflow setup to generate a PDF document](/document_generation.png) 

## Automatically emailing documents as attachments
Once your system is generating documents automatically, you can set it up to email those out to people as attachments, also automatically without any user input. That’s great if you’re processing a large number of documents, for example invoicing hundreds or thousands of people per invoice run, it could be quite a time saver.

To set this up, create an automated notification as normal, to send an email to the intended document recipient. Just make sure that the body ‘template’ contains a reference to the field name of the document that you want to attach the document field must be in the table that the notification view’s based on.

e.g. your template body could be
`Dear {forename},

Many thanks for your custom with us this month. Your invoice {invoice number} is attached.

Regards
XYZ

{invoice file}
` 

> Note – we recommend setting it up to send to someone within your organisation as a test, before switching to the actual recipient.