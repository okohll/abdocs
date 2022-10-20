---
title: "Privileges"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 30
description: The different types of privilege and how they can be assigned
tags:
- Software Architect
- requires update
---
In Agilebase, there are three privilege levels, as well as a special 'develop' privilege.

The three privileges take effect per table, i.e. a user/role can have certain privileges on one table and different ones on another.

Privileges are additive - if a user is a member of multiple roles, they gain all the privileges from each of those roles added together, plus any they may have individually assigned.

## Privilege levels

* **View**: ability to see data in a table
* **Edit**: ability to create, edit and delete data in a table (create and delete subject to various table options)
* **Develop**: the privilege that allows you to use the 'application building' features of Agilebase, relating to a table. Namely the ability to
    * modify the structure, i.e. create/delete fields, tabs, change options etc.
    * create, edit and delete views from the table, including creating charts, maps and word clouds.
    * upload or create printout templates for views
    * view usage statistics about a table
    * Develop also allows some extended user features
        * delete any user's comments from a table
        * unlock locked records to allow editing (one at a time)
        * override table options which would normally disallow adding/removing records from a table
        * override options which would normally disallow exporting data to a spreadsheet
        * import data from spreadsheet
        * override options which would normally disallow global editing of data in the table

Privilege levels work in conjunction with [Learner Progression levels]({{<relref "/docs/introduction/learner-progression">}}), for example, only someone at level Citizen Developer level 3 can have Develop privileges assigned to them.

> Two Factor Authentication is required for any user with any Citizen Developer or Software Architect role.

### Assigning table privileges

* Table privileges can be assigned to one or more users or roles from that table's editing screen.
* From a user or role editing screen, privileges on one or more tables can be assigned

The two methods are equivalent, whichever is the most convenient for a given purpose can be used.

Managing privileges by role rather than by individual user is recommended. That makes managing large numbers of users easier and also more secure as it's easy to see which privileges each type of user has and which they don't.

To assign one or more role or user privileges to a table:
1. [Edit a table]({{<relref "/docs/tables/adding-and-removing/#editing-a-table">}})
2. Open the _roles and privileges_ panel, then select or un-select any privileges required

To assign one or more table privileges to a particular role or user:
1. On the homepage, toggle on development mode
2. Click _roles_ or _users_
3. Select the role or user to assign privileges to, then select or un-select any privileges required

## Related to privileges

Database systems often have the concept of row level privileges. The equivalent in Agilebase is the [multi-tenanting]({{<relref "roles#multi-tenanting">}}) system.

Individual fields in a table can be locked or hidden, see the [field options]({{<relref "/docs/fields/field-options/common-options#show-if-record-in-view">}})


