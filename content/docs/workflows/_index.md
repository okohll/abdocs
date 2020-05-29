---
title: "Workflows"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 10
description: A powerful set of automation features
---

A workflow is a task that processes data to acheive a particular function. AgileBase has a number of workflow functions that can be used to automate or simplify the activities users would otherwise need to perform manually. Workflows are performed by agileBot.

**Meet agileBot!** It can automatically edit records and create new records, saving a lot of manual typing. agileBot can be set up to follow rules for creating new records, editing values in existing records or taking other actions. The rules can be simple or complex, in fact anything that can be represented by a standard view, which makes it really powerful.

**agileBot!** also has the ability to send email notifications, generate documents and push data to 3rd parties. Importantly steps can be chained together. Many business processes can therefore be fully automated. As an example if the system stores recipes, whenever an allergen is changed, a product specification doc can be generated and emailed to significant customers.

## Creating a rule

Here are the basics.

1) A rule is represented by a view. First create the view to represent the rule. Choose what **action** you want the rule to perform

2) Any records which become visible in your rule view will trigger the action selected. So add filters (on a calculation if necessary) to select only the records you wish to trigger the action.

3) If creating or editing a record, the fields in the view will populate the new or existing record. Any fields in the view with the same name as a field in the table will populate that field with its data. The view field can be a calculation as well as a standard field.

4) Once the view’s created, you finish setting up by going to manage -> workflow. Fill in the options for ‘Recording the time of the last action’ by selecting a date field in the table the view’s based on. This date will be updated every time the workflow runs. If there’s no relevant date field existing, add one to the table.

5) Choose when the Workflow should be run. Use the option _manually only_ if for example you want the Workflow to run on a Button press. Alternatively, set the frequency you wish the Workflow to attempt to run. N.b. By clever use of filters the frequency becomes "how often do you want to check whether there are records to process". 
>Using _24 hours_ with a _DOW_ (Day of the Week) calculation allows you to run weekly workflows.  

![Screenshot of workflow action](/workflow.png)

