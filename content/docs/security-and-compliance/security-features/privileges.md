---
title: "Privileges"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 30
description: The different types of privilege and how they can be assigned
---
In agileBase, there are three privilege levels, as well as a special ‘administrator’ privilege.

The three privileges take effect per table, i.e. a user/role can have certain privileges on one table and different ones on another.

Privileges are additive - if a user is a member of multiple roles, they gain all the privileges from each of those roles added together.

## Privilege levels

* **View**: ability to see data in a table
* **Edit**: ability to edit data in a table
* **Manage**: the privilege that allows you to use the 'application building' features of agileBase, relating to a table. Namely the ability to
    * modify the structure, i.e. create/delete fields, tabs, change options etc.
    * create, edit and delete views from the table, including creating charts, maps and word clouds.
    * upload or create printout templates for views
    * view usage statistics about a table
    * Manage also allows some extended user features, which are
        * deleting any user's comments from a table
        * unlock locked records to allow editing (one at a time)
        * override table options which would normally disallow adding/removing records from a table
        * import data from spreadsheet
        * export data to spreadsheet (override any option to disallow this to users without manage privileges)
        * global edit (bulk edit) data in the table

Finally the **administrator** privilege allows full permissions over the complete system. An administrator can create/remove users, roles, tables etc., as well as assign table privileges to any user, including themselves.

> The administrator privilege is the only one that allows the user to add new tables.

> Two Factor Authentication is required for any user with manage or administrator privileges

### Assigning table privileges

* Table privileges can be assigned to one or more users or roles from that table's editing screen.
* From a user or role editing screen, privileges on one or more tables can be assigned

The two methods are equivalent, whichever is the most convenient can be used.

Managing privileges by role rather than by individual user is recommended. That makes managing large numbers of users easier and also more secure as it's easy to see which privileges each type of user has and which they don't.

To assign one or more role or user privileges to a table:
1. Expand the _Build Tables_ section in the lefthand navigation
2. Click a table
3. Click the pencil (edit) icon in the top toolbar (or click a record to load the editing screen)
4. Click the _manage_ tab at the bottom of the screen
5. Open the _roles_ or _users_ section, then select or un-select any privileges required

To assign one or more table privileges to a particular role or user:
1. Expand the _Administration_ section of the lefthand navigation
2. Click _roles_ or _users_
3. Select the role or user to assign privileges to, then select or un-select any privileges required

### Assigning the administrator privilege
1. Expand the _Administration_ section
2. Click _users_
3. Select the user to make an administrator
4. Open the _roles_ section
5. Tick the role marked **Grants administrative privileges**

## Related to privileges

Database systems often have the concept of row level privileges. The equivalent in agileBase is the [multi-tenanting]({{relref "roles#multi-tenanting"}}) system.

Individual fields in a table can be locked or hidden, see the [field options](https://todo.com)
