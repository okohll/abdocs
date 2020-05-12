---
title: "Checkbox Field Options"
date: 2020-05-12T16:40:00+01:00
type: docs
weight: 90
description: Options specific to checkbox (true/false) fields
---
## Default value
Simply whether the checkbox should default to ticked (true) or un-ticked (false) for new records.

## Don't set last modified
Whenever someone edits a record, agileBase automatically updates the [Last Modified]({{<relref "/docs/fields/field-types/special-field-types/automatically-present-fields#last-modified-auto">}}) and [Modified By]({{<relref "/docs/fields/field-types/special-field-types/automatically-present-fields#modified-by-auto">}}) fields of the table. This option prevents that happening when the checkbox field is ticked or un-ticked. There would not usually be a need for this but it may be useful in a minority of cases.

## Show digital signature
Causes the user interface to show the name & username of the person who last ticked or un-ticked the checkbox, along with a timestamp.

> Note these can only be shown for the maximum time that record history (audit trail) data is stored for, by default 12 months. See [enhanced audit trail]({{<relref "/docs/security-and-compliance/security-features/usage-monitoring/usage-reporting#enhanced-audit-trail">}}) for details of extending this.
