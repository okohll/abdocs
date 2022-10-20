---
title: "Types of Workflow Actions"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 110
description: Each workflow can perform a single specific action
tags:
- Certified Architect
---

## Types of Action

Actions fall in to two types:

* Those that effect data held within Agilebase tables 
* Those that send data to another system. 

### Alter Data
Use the dropdown within the _workflow_ section of the _manage_ tab of the view to control the action that will be applied to every record in the view.
Options are:
1) Create record - This will create a new item in the nominated table
2) Update record - This will alter the values of the record.
3) Lock record - This will apply a record level lock on the item.
4) Delete record - This will totally remove the record.

![Workflow actions that alter data](/workflow-manage-new.png)

#### Creating records

If 'create record' is chosen, a couple of other options appear.

1) You can select which table the new record should be created in
2) 'Auto-connect new records' can be used when [chaining workflows]({{<relref "advanced/chaining-workflows">}})

### Sending Data
The options to send data are contained within the _send_ section of the _workflow_ tab. Matching records will be sent to the appropriate **function**.

5) [Send data to a third party via API]({{<relref "/docs/workflows/send-data-to-a-third-party-via-API">}})
6) [Send an email]({{<relref "/docs/workflows/send-email">}})
7) [Send an email Chaser]({{<relref "/docs/workflows/send-chaser">}})
8) [Send data to a calendar]({{<relref "/docs/integrations/calendar">}})
9) [Send to document generator]({{<relref "/docs/workflows/send-document-generator">}})
10) RSS feed - See facility with [PULL API]({{<relref "/docs/integrations/setting-up-the-pull-api">}})

![Workflow functions that send data](/workflow-send-new.png)