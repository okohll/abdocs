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

1) A workflow is represented by a view. First create the view to represent the workflow.
   - From the development homepage, click the '+ Workflow' button
2) Open up the 'workflow - edit records' panel. Choose the type of workflow, e.g. 'create new records' or 'update records'. Fill in the options for ‘recording the time of the last action’ by selecting a date field in the table the view’s based on. This date will be updated every time the workflow runs. If there’s no relevant date field existing, you can create one here.
3) Any records which become visible in your workflow view will trigger the action selected. So add [filters]({{<relref "/docs/views/filters">}}) (on a calculation if necessary) to select only the records you wish to trigger the action.
4) If creating or editing a record, the fields in the view will populate the new or existing record. Any fields in the view with the same name as a field in the table will populate that field with its data. The view field can be a calculation as well as a standard field.
5) Choose when the workflow should be run. Use the option _manually only_ if for example you want the workflow to run on a button press. Alternatively, set the frequency you wish the workflow to attempt to run. This determines how often the system should check whether there are records to process. The check is only done if there's been a relevant change to the state of the system e.g. records edited since the last workflow run. However all workflows with a check frequency are guaranteed to run at least once a day.

## Scheduling
The _Frequency_ option sets when the workflow runs.

* Manually Only
  * This can be used if you want the workflow to run on a button press by users for example. See [workflow buttons]({{<relref "advanced/workflow-buttons">}})
* Every 24 hours
  * The workflow is guaranteed to run once a day at the time you specify (accurate to a minute or two, there may be slight tweaks depending on how many other workflows are scheduled to run at the same time).
    > Note 1: the workflow may actually run more than once a day in some cases, e.g. if a server reboots for upgrade purposes. Please bear this in mind in the design of your workflows. You may want to add a filter on the field used to record the time of last action, to prevent duplicate runs within e.g. 12 hours. 

    > Note 2: the scheduling is done once a day around 8am. So if at 10am, you set a workflow to run in the afternoon, the first run won't be until the next day

    > Note 3: Using _24 hours_ plus a filter on a 'day of the week' calculation allows you to run weekly workflows, similar for monthly etc.

* Other times: every 5 mins, 10 mins, 20 mins etc.
  * These are scheduled to run whenever someone edits data that could effect the workflow view.

    For example, if a 10-minute workflow view has a filter on it that filters for only records where a 'status' field is 'completed', then it will be scheduled to run in 10 minutes time whenever someone changes a status. All pending records will be processed at that time.

## Workflow options
Some of these options will be relevant only for certain types of workflow, or in certain cases.

### Run with system privileges
Relevant only for workflows which are run manually by users, through the use of [workflow buttons]({{<relref "advanced/workflow-buttons">}}).

Workflows which run automatically in the background, on a timed basis, always run with system privileges. In other words they can take any action on any record. However when someone runs a workflow manually by pressing a button, the workflow by default runs with the privileges of the logged in person. So for example if the workflow is set up to edit records in a particular table, but the user doesn't have privileges to edit that table, it will fail.

This option allows the developer of the workflow to override that, making the workflow able to act on any table and even on locked records.

### Auto-connect new records to records created in the previous chained workflow steps
This option works if a previous workflow step creates a new record, and **one record only**.

If a record is created by *this* step, and the table contains a relation to the table in the previous step, the relation will be set to link to it.
For example, if step 1 creates a company record and step 2 creates a contact (containing a relation to a company), the contact will be linked to the company.

This doesn't work if the first step creates multiple companies.

### Make subsequent steps act on the same record as this one
Like 'run with system privileges', this only takes effect if a workflow is run manually, from a button in a record.

When running a workflow from a button, the workflow is automatically filtered to make it only run on the single record which the button was pressed in. This option makes subsequent steps in the workflow chain also act only on that record (as long as those views are created from the same table, or contain its primary key).

### Recurse
Make the workflow run repeatedly until there are no more rows to process, before finishing or moving on to the next step in the chain.

This can be useful for making [recursive workflows]({{<relref "advanced/recursive-workflows">}}), or just if there are lots of rows to process in one go (otherwise a max. of 10,000 rows will be processed).

Note the workflow will not recurse indefinitely, it wil allow 50 iterations at most for one run.

### Show the record when the workflow (chain) completes
This is only relevant if a workflow is run manually by a logged in user, and also only makes sense if the workflow step acts on one record only. 

If a workflow step creates a record, or otherwise acts on a record, ticking this option will make the user interface redirect to that record following completion of the workflow, or the entire chain if more than one are linked together.

Only one workflow in a chain can have this option ticked.

For example, if a user presses a button which creates an invoice record and document, ticking this option will ensure the user sees that invoice once it's created.