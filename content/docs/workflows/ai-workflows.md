---
title: "AI workflows"
date: 2025-02-16T12:35:00+01:00
type: docs
weight: 200
description: Use AI to query, create and edit records
tags:
- Junior Software Architect
---
Standard workflows are automations that create, update or delete records. 

AI workflows are exactly the same in that regard: a view is created which select the records to act on by filtering.

The only difference is that a standard workflow to update or create records will use SQL calculations to define the contents of the field values to be saved. For example, if a workflow creates an invoice record, it might define a calculation to save to a *VAT amount* field as

```{net amount} * 0.2```

Calculations can of course output text, numbers or any other supported data type.

An AI workflow uses SQL calculations as well, but to create a *prompt* to send to the AI, rather than a direct calculation of results to save to a field. The prompt is sent, the response is returned and that response is the content saved.

The examples below should clarify how that works.

## Creating an AI workflow

There are two types of AI workflows, those which create new records or those which update existing ones.

In either case, follow the same steps as normal to start i.e.
1) A workflow is represented by a view. First create the view to represent the workflow.
    - From the development homepage, click the '+ Workflow' button
2) Open up the 'workflow - edit records' panel. Choose the type of workflow, e.g. 'create new records' or 'update records'. Fill in the options for ‘recording the time of the last action’ by selecting a date field in the table the view’s based on. This date will be updated every time the workflow runs. If there’s no relevant date field existing, you can create one here.
3) Any records which become visible in your workflow view will trigger the action selected. So add [filters]({{<relref "/docs/views/filters">}}) (on a calculation if necessary) to select only the records you wish to trigger the action.

Following that, the next steps depend on the type of workflow.

### Updating existing records

To update a field with AI, create a calculation with the same name as that field. With the calculation open, tick 'use as AI prompt'.

Then use the calculation to create the prompt, e.g.

```sql
'Write a poem exhorting customers to buy ' || {product name} 
```

for example.

Then when the workflow runs, the generated prompt will be sent to the AI. Any response it returns will be saved to the target field, i.e. the one with the same name as the calculation.

### Adding new records

Setting up an AI workflow to create new records is a two step process. Firstly, add a calculation to generate the prompt for the AI. The calculation can be called anything, e.g. 'AI prompt'. It could be for example

```sql
'Which ingredients would we use to make ' || {recipe name} || '?'
```

Tick the 'use as AI prompt' in the calculation options.

The next step is to choose the fields to save the results into. Go to the 'fields' panel of the view. The system will show you a dropdown of available fields from the target table, simply add each you want to be part of the results.

For this example those might be 'ingredient name' and 'amount'. Although an amount wasn't part of the prompt, the fact that Agilebase asks for an amount should be enough to tell it to supply a reasonable value.

![AI workflow](/ai-workflow.png)

