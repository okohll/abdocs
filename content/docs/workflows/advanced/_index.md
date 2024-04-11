---
title: "Advanced information on Workflows"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 200
description: Further information about Agilebase automation features
tags:
- Junior Software Architect
- v6
---

## Logging

If you are using the more advanced features of agilebase workflows then knowing where to look for logging information will become important. At the bottom fo the _workflow - edit records_ panel when editing a view, recent logs are shown.

They will contain success and failures of past runs as well as the next time the workflow is scheduled to be run.  

![Viewing the logging history of a Workflow](/workflow-history.png)

## Workflow privileges

If workflows are run in the background on a timed basis, e.g. every 10 minutes, they don't need privileges on the tables they act on. They effectively run as a 'system user', not a real person.

If workflows are however kicked off by a person pressing a [workflow button]({{<relref "workflow-buttons">}}), or [creating or opening a record]({{<relref "workflow-on-create">}}), they run with the privileges of that user.

That can be overridden by ticking the option *Allow workflow to act on any table* when editing the workflow. If for example you have a workflow button which creates a new purchase order when the user presses it, but the user has no privileges on the purchase orders table, that option will allow the workflow to run successfully.  

