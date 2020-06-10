---
title: "Chaining Workflows"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 210
description: Chaining Workflows
---

## How to chain Workflows

Simply set the appropriate view in the Chain workflow section of the _workflow_ page of the _manage_ tab.

![Configuring the PULL API](/workflow-chain.png)

## Passing the Current record ID through chained workflows

**TODO**

## Using hidden "flagging" fields
It is often necessary to **find** the source record when chaining workflows. This is especially true when creating records in other tables.
A trick to allow you to find the appropriate record is to use and set a flag field in the source table.
1) Step 1 - Use an Update Workflow to set the flag to True
2) Step 2 - Other workflows can join to this table and filter by _flag=true_
3) Final Step - Remember to set the flag to false as the last step in the chain, so that it is not inadvertently included in its next running. 

## Visualising linked workflows
We’ve added one more thing to the system to make working with these multi-step workflows easier. When you click on a workflow step in the admin interface, it will colour all preceding steps (if any) in green – fading to lighter green the further back they go. Similarly all future chained steps are marked in blue, fading to light blue the further forward they are in the chain.

![Configuring the PULL API](/workflow-recursive.png)