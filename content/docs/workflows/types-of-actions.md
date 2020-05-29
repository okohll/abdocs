---
title: "Workflow Actions"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 10
description: Each workflow can perform a single specific action
---

## Types of Action

Actions fall in to two types: 

* Those that effect data held within agileBase tables 
* Those that send data to another system. 

### Alter Data
Use the dropdown within the _workflow_ section of the _manage_ tab of the view to control the action that will be applied to every record in the view.
Options are:
1) Create record - This will create a new item in the nominated table
2) Update record - This will alter the values of the record.
3) Lock record - This will apply a record level lock on the item.
4) Delete record - This will totally remove the record.

![Workflow actions that alter data](/workflow_manage.png)

### Sending Data
The options to send data are contained within the _send_ section of the _workflow_ tab. Matching records will be sent to the appropriate **function**.

5) [Send data to a third party via API]({{<relref "/docs/workflows/send-data-to-a-third-party-via-API">}})
6) Send an email Chaser
7) Send an Email
8) Send data to a calendar
9) Send to document generator

![Workflow functions that send data](/workflow_send.png)