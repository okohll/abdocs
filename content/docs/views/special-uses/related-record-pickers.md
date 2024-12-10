---
title: "Related Record Chooser"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 140
description: Using a view to choose a record for a relation field
tags:
- Junior Software Architect
- v6
---
When a [relation field]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}) is part of a form, the user can choose a record to link to from a view of items in the related table.

That way, a subset of records can be shown relevant to the situation. For example, imagine there is a table of company records, which store customers and suppliers. When selecting a customer for a new invoice record, the user should be able to select only from companies which are customers, so a filtered view can be used.

See the [view to use]({{<relref "/docs/fields/field-options/relation-field-options#view-to-use">}}) relation field option for more details, including how to filter the set of records further, perhaps with contextual data like field values from the record the chooser is in.