---
title: "Learner Progression"
date: 2022-02-18T16:40:00+01:00
type: docs
weight: 6
description: The journey from citizen developer to software architect
tags:
- Developer
---
> Note: this page describes features which are coming soon but which are not currently available.

agileBase's unique learner progression pathway allows people to be supported on the path to becoming a no-code software architect. Beginners need no technical knowledge at all and typically come from a diverse range of non-IT backgrounds.

Those that wish to can proceed to become software architects who can build complex applications to support their organisations, including powerful workflow features and integrations with other applications. The only prerequisite skills needed are the ability to think rationally, be willing to learn and be able to plan.

There will be help along the way and people can stop at whatever level seems most useful.

The five stages of 'seniority' that learners can progress through are

## Citizen Developer Level 1
The term 'Citizen Developer' is widely used in the no-code world. The most concise definition is someone who creates their own applications, using no coding ([more info](https://research.aimultiple.com/citizen-developer/).

Citizen Developer level 1 is the start of the agileBase learner progression journey. An employee can alter parts of the system to suit their own needs, without needing to bother anyone else further up the organisation hierarchy.

Importantly, the changes they make can only be seen by them - no one else in the organisation is affected, so they can do no harm!

In this way they can accomplish something useful for themselves while getting a taste for development, without worrying that they're going to mess up anything important.

### Details
Specifically, an agileBase citizen developer can
* make simple changes to a [view]({{<relref "/docs/views">}}), i.e.
	- remove or add fields, excepting any that are marked 'confidential' (only higher level developers can access those fields)
	- rearrange fields
	- add filters or remove filters (except on 'confidential' fields)
* add and remove [charts]({{<relref "/docs/charting">}}) from their version of the view

The altered version of the view is seen only by them. Everyone else sees the original view. They can revert to the original (losing their changes) at any time.

For example, a citizen developer may want to create a list of records which is filtered to only show ones assigned to them.

The Citizen Developer role is automatically assigned once a user has used the system for a certain period of time and got used to it by carrying out standard functions like adding and editing records. It's assigned internal staff only though, not to [community users]({{<relref "/docs/security-and-compliance/security-features/users/community-users">}})

## Citizen Developer Level 2
This level is suggested or 'unlocked' once a citizen developer has carried out a certain number of citizen development functions and has therefore started to learn how no code development works in a safe environment.

However to activate the level, it must be manually assigned by a Software Architect level user, as it allows changes to the system which can affect other users.

A citizen developer level 2 can
* create new views that everyone can see, from any table
	- edit them as per the citizen developer functionality above
	- additionally they can add and remove simple joins, to include data from other tables in a view
* remove views that they themselves have created (not those that others have)
* create their own [tables]({{<relref "/docs/tables">}})
	- add, edit and remove fields and tabs from those tables
	- edit basic properties of the fields
	- assign privileges (up to edit) on those tables, using existing roles
* create [tiles]({{<relref "/docs/tiles">}}) and delete tiles they've added themselves

## Citizen Developer Level 3
A Software Architect (see below) can, at their discretion, assign a citizen developer 'manage' privileges on a table (or tables). That allows them to
* add [fields]({{<relref "/docs/fields">}}) to a table
* remove fields that they themselves have added (not others)
* edit basic properties of any field, e.g. the list of options in a dropdown box
* edit basic properties of any regular view. Workflow and API views will be read-only

At that point, the user is automatically assigned Citizen Developer level 3.

## Junior Software Architect
A junior software architect can use practically all of the application building functionality of agileBase. For example
* Create [workflows]({{<relref "/docs/workflows">}}) (including chasers, document generation)
* Set up [APIs]({{<relref "/docs/integrations">}})
* Add complex [joins]({{<relref "/docs/views/joins">}}) to views
* Create, edit and delete [roles]({{<relref "/docs/security-and-compliance/security-features/roles">}})
* Assign [privileges]({{<relref "/docs/security-and-compliance/security-features/privileges">}}) to roles or users up to the 'edit' level
* Remove fields, views etc. created by anyone
* Edit the advanced properties of fields and views, including field visibility rules for example

Their only limitations are to do with managing the organisation as a whole, including other users.

## Software Architect
As well as building and disassembling applications, software architects can set company-wide settings and manage the account as a whole. They have full discretionary spend and can 
* Add and remove [users]({{<relref "/docs/security-and-compliance/security-features/users">}})
* Edit company level settings (e.g. whether to enforce 2FA)
* Change table [sensitive and personal data]({{<relref "/docs/tables/sensitive-data">}}) settings (GDPR)
* View and controls users' learner progression levels and 'budget' limits
* Assign any privileges up to the highest 'manage' level



