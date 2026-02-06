---
title: "Download files from Agilebase to third parties"
date: 2026-02-06T16:40:00+01:00
type: docs
weight: 145
description: Allow third party systems to download document files stored in Agilebase
tags:
- Junior Software Architect
- v6
---
## Preparation
Create a view containing the files you want to make available via the API. I.e. [create the view]({{<relref "/docs/views/creating-a-view">}}) and add a [file field]({{<relref "/docs/fields/field-types/special-field-types/file">}}) to it.

Turn the view into an API view by setting up the [PULL API]({{<relref "setting-up-the-pull-api">}}) for it.

## Downloading a file

The view will now act as a pull API, however as the results are in JSON format, for the file field, you only get the filename, not the actual file itself.

To download an individual file, use a URL of the format

https://[subdomain].agilebase.co.uk/agileBase/api.ab/download/[company ID]/[view ID]/[row ID]/[file field ID]

Where **company ID** and **view ID** are the same as for the corresponding pull API for the view - as shown in the **use API** panel for the view.

**row ID** is the internal numeric identifier for the specific record you want the file for. It can be seen in the results of a call to the pull API.

**file field ID** is the internal field name of the file field. It can be seen by opening the fields list for the view and clicking on the file field.

### Authentication

Use the same Authorization header as for the pull API, as shown in the view's **use API** panel.
