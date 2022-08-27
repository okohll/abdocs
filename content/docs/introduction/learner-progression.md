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

Agilebase's learner progression pathway enables you to transform your career. You can go from  a citizen developer to a no-code software architect. 
 
Citizen developers can create their own applications using no code. Software architects can build complex applications, including powerful workflow features and integrations with other applications.
 
To go on this journey requires no technical knowledge. Beginners - "citizen developers" - come from a diverse range of non-IT backgrounds. The only skills you need are the ability to think, be willing to learn, and be able to plan.
 
Agilebase will help you every step of the way. And you can stop at the level that is useful to you.
 
Agilebase enables citizen developers to pass through five stages on their way to becoming software architects:

## Citizen Developer Level 1
This is the start of the agileBase journey. At this level you can create your own applications, using no coding. 
 
An agileBase citizen developer can create 'personal copies' of any [view]({{<relref "/docs/views">}}) and edit those copies
* remove or add fields, excepting any that are marked 'confidential' (only higher level developers can access those fields)
* rearrange fields
* change field sorting
* add filters or remove filters (except on 'confidential' fields)
* add and remove [charts]({{<relref "/docs/charting">}})

> A confidential field is one that has a [visibility]({{<relref "/docs/fields/field-options/common-options#show-if-record-in-view">}}) rule, or is used for [multi-tenanting]({{<relref "/docs/security-and-compliance/security-features/roles#multi-tenanting">}}).

The personal copy of the view is seen only by them. For example, a citizen developer may create a list of records filtered to show ones assigned to them. Everyone else in the organisation sees only the original view.

You earn the Citizen Developer title once you have carried out standard functions. These include adding and editing records. The title is assigned to internal staff not to [community users]({{<relref "/docs/security-and-compliance/security-features/users/community-users">}}).

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
	- assign privileges (up to edit) on those tables, using existing roles or direct user privileges
* create [tiles]({{<relref "/docs/tiles">}}) and delete tiles they've added themselves

## Citizen Developer Level 3
A Software Architect (see below) can, at their discretion, assign a citizen developer 3 'manage' privileges on a table (or tables).

That allows them to
* add [fields]({{<relref "/docs/fields">}}) to those table, excluding referenced fields
* remove fields that they themselves have added (not others)
* edit the basic properties of any field in those tables, e.g. the list of options in a dropdown box

Additionally, actions not related to having manage privileges on a particular table are
* edit the basic properties of any regular view. However, workflow, API and some other types of system view will be read-only

## Junior Software Architect
A junior software architect can use practically all of the application building functionality of agileBase. For example
* Create [workflows]({{<relref "/docs/workflows">}}) (including chasers, document generation)
* Set up [APIs]({{<relref "/docs/integrations">}})
* Add complex [joins]({{<relref "/docs/views/joins">}}) to views
* Create, edit and delete [roles]({{<relref "/docs/security-and-compliance/security-features/roles">}})
* Assign [privileges]({{<relref "/docs/security-and-compliance/security-features/privileges">}}) to roles or users up to the 'edit' level
* Remove fields, views etc. created by anyone
* Edit the advanced properties of fields and views, including field visibility rules (confidentiality rules) for example

Their only limitations are to do with managing the organisation as a whole, including other users.

## Software Architect
As well as building and disassembling applications, software architects can set company-wide settings and manage the account as a whole. They have full discretionary spend and can 
* Add and remove [users]({{<relref "/docs/security-and-compliance/security-features/users">}})
* Edit company level settings (e.g. whether to enforce 2FA)
* Change table [sensitive and personal data]({{<relref "/docs/tables/sensitive-data">}}) settings (GDPR)
* View and controls users' learner progression levels and 'budget' limits
* Assign any privileges up to the highest 'manage' level



