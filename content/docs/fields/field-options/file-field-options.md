---
title: "File Field Options"
date: 2020-06-04T16:40:00+01:00
type: docs
weight: 130
description: Options specific to file fields, including for generating documents
tags:
- Junior Software Architect
---
## Type
The type of document typically stored by this field. Can be
* Document - such as a PDF file or spreadsheet for example
* Image/photo
* Profile photo

The selection affects the display in the user interface in some ways. In particular when a profile photo field is moved to the start of the record, it is displayed as part of the record header.

## Image resolution
This option allows you to specify that the system should automatically down-size any large images uploaded. This could be to save storage space (for which there is a cost), or it may be appropriate if these files are going to be attached to emails sent by the system.

## Template
Type the name of a template to be used for [generating PDF documents]({{<relref "/docs/fields/field-types/special-field-types/file/document-templates">}}) to be stored in this field.

## View to use
The system will look in this view for a template with the name specified above.

## Paper size
When a PDF is generated, base it on this size of paper. The default is A4, changing this can be useful if e.g. you want to use the system to print labels.

## Footer
Optionally, add a footer to every page of a generated document, including the name of the document, page number and total number of pages.

> The document name is set to be the contents of the first (non-ID) field in the 'view to use' (see above), so you can set it to whatever you like. A calculation can be used if required.
