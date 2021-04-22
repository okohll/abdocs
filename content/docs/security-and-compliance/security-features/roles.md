---
title: "Roles"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 20
description: Organising users into groups for better management
---
The primary purpose of roles is to apply privileges to groups of users, rather than applying them individually. That makes managing large numbers of users easier and also more secure as it's easy to see which privileges each type of user has and which they don't.

Roles have some other important uses, such as multi-tenanting, described below.

## Creating a role
1. Expand the _Administration_ menu in the lefthand sidebar
2. Click _roles_. You'll see a list of existing roles
3. Click the plus button in the toolbar at the top

You should now see an editing screen with the details of the role you just created. You can give it a name and there are a few options:
![Role details](/role-details.png)

**Allow Export**  
Referrs to exporting to spreadsheet - see [spreadsheet exports]({{<relref "/docs/integrations/exporting-to-spreadsheet">}})

**Allow global editing**
Users with [edit privileges]({{<relref "privileges">}}) on a particular table, when added to this role, will be able to perform global edits on the data.

To perform a global edit, the user should
1) filter the view (by typing into the filter boxes at the top of each column) to narrow down the rows to those which should be edited
2) double click on a column header in a view, to edit the data in that field. The field must be from the view's parent table.
3) click the 'edit filtered' button which appears
4) type in the value you want to apply and follow through the prompts

**User Visibility** and **Restrict Data Access**  
These are used to set up [multi-tenanting](#multi-tenanting)

### Members
Tick each user to add them to the role. Users will gain all the privileges defined by the role.

### Privileges
Select the [table privileges]({{<relref "/docs/security-and-compliance/security-features/privileges">}}) which will apply to members.

Privileges are additive - if a user is a member of multiple roles, they gain all the privileges from each of those roles added together.

## Multi-tenanting
Multi-tenanting is the ability to separate users into groups who can’t see each other’s data. This can be used for example to allow different sets of companies, clubs, or membership groups (or whatever the organisational group is) to use the same system features whilst remaining separate from each other.

> Multi-tenanting is a powerful feature that can be used not just for customers to segragate data amongst their users.
> 
> Partners can also use this facility if building software to widely market. In that case, each customer they sign up can very quickly be set up with their own private dataset, whilst the partner retains the ability to add features which will automatically apply to everyone.

To set up multi-tenanting:

1. first [add a text field]({{<relref "/docs/fields">}}) to all tables in the system for which you want data to be segragated. The field must be named the same in every table, for example's sake here let's assume it's called 'account name'.
2. Then create one role for each set of users who you want to segregate. We'll assume there's one called 'Customer A'.
3. In the role details screen for the Customer A role, tick _user visibility_. That means that users in this role won't see users in other roles with the same option ticked. In other words, users from Customer A won't be able to select Customer B or Customer C users when doing things like adding comments or assigning users to records.
4.  Under _restrict data access_ in the role details, enter `account name = Customer A`
5.  Finally, ensure the account name field is present in all views based on the table. When creating a view, any fields used for multi-tenanting will automatically be added but you may need to retro-fit any existing views.

This has two effects -
1. When a user assigned to the Customer A role creates a new record in one of the multi-tenanting tables, the account name field will automatically be populated with the value Customer A (as entered under _restrict data access_). The field will be invisible to them - they won't be able to see or edit the value.
2. When looking at records in a view, a filter will be automatically applied so the user only sees records where account name = Customer A.

Users who **aren't** a member of the role will see the account name field in the data editing form and in views. This can be useful for allowing e.g. group managers to see all data.

If any multi-tenanting roles are set up, then views which **don't** contain a multi-tenanting field will be marked in red in the administration interface, as a warning. If a multi-tenanting user loads one of these views, they will see all records. Typically, practically all views will need the multi-tenanting field to be present.

### Complex multi-tenanting

#### Multi-level
Users may be a member of more than one multi-tenanting role. For example you may use two multi-tenanting fields/roles, one for a company and another for a division. Members of a company role will be able to see data from all divisions in their company and members of both a company and a division role will only be able to see data for a single division.

#### Multi-account (via multiple roles)
It's also possible for a user to be a member of multiple roles, all of which are set to multi-tenant on the same field, with different values. E.g. if a user is a member of Company A and Company B roles as in our example above, they will see data from those two companies when viewing records, but not Company C.

This works best when the user has read-only privileges on the data, e.g. for a manager reporting on those two companies. They can view records but not add new records, as the system is unable to determine the value of the account name field to use.

#### Multi-account (via _contains_ filtering)
It's also possible to define a role filter under _restrict data access_ with a 'contains' rather than an '=' filter. You can then use a naming convension for your account name values to allow members of this role to see multiple accounts. As above, users of this role will need to be read-only on the data.

#### API setup
In a multi-tenanting account, it's possible to create new tenants, with users, by API, as opposed to the manual actions of an administrator. See [Creating user accounts with the API]({{<relref "/docs/integrations/creating-user-accounts">}}).
