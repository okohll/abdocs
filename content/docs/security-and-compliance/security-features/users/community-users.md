---
title: "Community Users"
date: 2021-11-05T12:40:00+01:00
type: docs
weight: 15
description: Allowing access to people outside the organisation
tags:
- Owner
- Administrator
---
agileBase is primarily a platform for building back office systems for employees (or members of the organisation) to use.

However, it's common to allow access to people outside the organisation to perform limited data entry tasks. For example, you may wish your suppliers to be able to upload certificates of conformances to items they sell you, or you may have a large workforce of contractors who you require to fill in timesheets.

It may be that you don't wish to supply each person a full agileBase license because
* there will be a large number of them, so there'll be management and cost issues
* you wish to restrict what they can do in the system further than can be accomplished with roles and privileges

The Community Users mechanism allows this.

> Community Users have limited access (described below), with subscriptions which are significantly less costly and must be purchased in bulk. Once a block of community users is purchased, you can set up and remove as many as you need within the upper limit of that block.

## Validity
To be valid for a Community User subscription, a person must be one of
* a *supplier*
* a *contractor*
* or a *member of the public*

Employees must be standard 'core users' not community users, even if they only have read-only privileges or access the system intermittently.

## Setup
### Configuring a community of users
To set up a new community of a certain type, a role must be created for them. The role privileges will determine which tables they have access to.

Each community user must be a member of that single role only - no additional roles or privileges can be applied.

Different communities of users can be created by creating different roles. A separate block of subscriptions must be purchased for each role created. Therefore you can have multiple communities, for example one for members of the public and another for contractors, or two different types of contractor.

When setting up the role, tick the 'members are community users' tickbox. Then create a user and assign them to that role.

## Functional Restrictions
The following restrictions appropriate to users of an outside community are applied.

* a community users role can be set to allow VIEW access to up to 10 tables, plus EDIT privileges on up to 3 additional tables
* for the 3 tables which allow editing, community users can only see and edit records they themselves have created. All records from read-only tables can be seen.
    * for example, a user may have read-only access to a list of companies. Against each company, they can add and edit timesheet records
* community users only see comments added by themselves or specifically sent to them (comments are commonly used for internal company discussions)
* a community user can have up to 6 tiles on their homepage
* the homepage is fixed for community users, they can't add or remove tiles

Further, community users are unable to 
* export data
* create charts
* unlock locked fields or records
* bulk edit

> Together, all of these measures will help protect data in the organisation whilst simplifying the user interface, allowing people from outside to be able to usefully carry out work, without having to go through the expense of creating or purchasing dedicated applications for them.
