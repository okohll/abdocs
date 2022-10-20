---
title: "Usage Monitoring"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Viewing usage statistics relating to users, tables and views
tags:
- Software Architect
- v6
---
Agilebase comprehensively logs changes to data in the system as well as changes to the structure of the system. Powerful [reporting facilities]({{<relref "usage-reporting">}}) allow the generation of audit trails, trend monitoring, customer success monitoring etc.

## What is logged
### User actions
The following actions are recorded
* logins, including connection details
* record edits (create, update and delete)
* global edits
* comment additions and removals
* data imports and exports
* viewing and searching/filtering data in views
* password resets

When logging a record deletion, the data values deleted are logged.

Further, for every record in a table, the following metadata is stored and can be included in views:
* The creation time and time of last update
* The user who created the record and who last updated it
* The view count: how many times the record has been opened
* A visual activity histogram showing the number of edits per week over the past six months

See [automatically present fields]({{<relref "/docs/fields/field-types/special-field-types/automatically-present-fields">}}) for full details.

### API and workflow actions
Data changes or outflows arising from [API calls]({{<relref "/docs/integrations">}})are logged to the same log store as user actions. Instead of logging the user taking the action, it's logged as an API call with the IP address of the source of the request.

Automated [workflow]({{<relref "/docs/workflows">}}) actions are also logged. Each is marked as a workflow actions with the name of the action (i.e. the view name) to identify it.

### Administration and management actions
All significant actions are recorded, in summary
* adding, updating or removing users, roles and privileges
* table additions and removals, field additions and removals, data constraint additions and removals
* view additions, updates and removals
* chart edits

## Viewing logs
Changes to schemas (e.g. tables and views) can be seen in the editing panels for those objects. On the development homepage, a history of recent changes can be seen.

Changes to an individual record can be seen from the 'history' link at the bottom left of any editing screen.

If the account has the [enhanced audit trail]({{<relref "/docs/security-and-compliance/security-features/usage-monitoring/usage-reporting#enhanced-audit-trail">}}) then all data can be queried using agileBase views.

## Retention periods
Data is retained for 12 months as standard. The enhanced audit trail allows customers to define their own retention period, the maximum being unlimited.
