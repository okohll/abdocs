---
title: "Sequence Field Options"
date: 2022-03-29T10:40:00+01:00
type: docs
weight: 105
description: Options specific to auto-generated numeric sequence fields
tags:
- Architect
---
## Do not auto-populate
When this is un-ticked, the next number in the sequence will always be generated and saved for this field, whenever a new record is created.

When the option is ticked, the field value will be left blank when a new record is created. A button will appear in place of the value, which on pressed will create and save the next sequence value.

One benefit of this is to allow 'accidental' creation of records without using up the next value in the sequence. So for example, if an 'invoice number' field has this option ticked, creating an invoice and then immediately deleting it won't use up a sequence value, leaving a gap.

Note that if records are created by a background workflow, this option will be overriden and sequence values will always be generated and saved. The assumption is that automated workflows will always create the correct records.