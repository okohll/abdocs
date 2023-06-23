---
title: "Workflows"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 100
description: A powerful set of automation features
tags:
- Junior Software Architect
---

A workflow is a task that processes data to achieve a particular function. Agilebase has a number of workflow functions that can be used to automate or simplify the activities users would otherwise need to perform manually.

Workflows can automatically edit records and create new records, saving a lot of manual typing. The system will follow rules for creating new records, editing values in existing records or taking other actions. The rules can be simple or complex, in fact anything that can be represented by a standard view, which makes it quite powerful.

Workflows can also send email notifications, generate documents and push data to 3rd parties. Importantly steps can be [chained together]({{<relref "advanced/chaining-workflows">}}). Many business processes can therefore be fully automated. As an example if the system stores recipes, whenever an allergen is changed, a product specification doc can be generated and emailed to significant customers.

![Workflow](/workflow-edit.png)

## Creating a workflow

Here are the basics.

1) A workflow is represented by a view. First create the view to represent the workflow

2) Any records which become visible in your workflow view will trigger the action selected. So add filters (on a calculation if necessary) to select only the records you wish to trigger the action.

3) If creating or editing a record, the fields in the view will populate the new or existing record. Any fields in the view with the same name as a field in the table will populate that field with its data. The view field can be a calculation as well as a standard field.

4) Once the view fields and filters have been created, open up the 'workflow - edit records' panel. Choose the type of workflow, e.g. 'create new records' or 'update records'. Fill in the options for ‘recording the time of the last action’ by selecting a date field in the table the view’s based on. This date will be updated every time the workflow runs. If there’s no relevant date field existing, add one to the table.

5) Choose when the workflow should be run. Use the option _manually only_ if for example you want the workflow to run on a button press. Alternatively, set the frequency you wish the workflow to attempt to run. This determines how often the system should check whether there are records to process. The check is only done if there's been a relevant change to the state of the system e.g. records edited since the last workflow run. However all workflows with a check frequency are guaranteed to run at least once a day.

>Using _24 hours_ plus a filter on a 'd'ay of the week' calculation allows you to run weekly workflows.

For 24hr workflows you can optionally set a specific time of day for them to run.

