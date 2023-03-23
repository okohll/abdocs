---
title: "Users"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 10
description: Adding, viewing and removing users
tags:
- Software Architect
- v6
---
## Adding a user

You can add a new user from scratch, or clone an existing one. To add:
1. Go to the homepage and [toggle development mode on]({{<relref "/docs/introduction/development-mode">}})
2. Click the '+ USER' button under Lists at the top of the screen

To clone:
1. Go to the homepage and [toggle development mode on]({{<relref "/docs/introduction/development-mode">}})
2. Click the Users box at the top right to load a list of existing users
3. Click a user to clone to open up their editing panel
4. At the bottom, press the Clone button

If a cost is to be applied, this will be shown to you.

You should now see an editing screen with the details of the user you just created.
![Add user][/add-user.png]
![User editing](/new-user-details.png)

You can enter the user's name and username. If the username isn't their email address, enter their email address in the field provided too. This is useful
* to allow them to reset their own password by receiving a link by email
* to allow them to receive notifications when another user adds a comment against a record
* as various features allow a user to be assigned to a record. Workflows can be set up to email those users. E.g. if an account manager is assigned to a customer, you may want to email them when a complaint is received from that customer.

### Passwords
The recommended way to set passwords is for the user to choose their own, which they can do once they have a username and email address filled in. They will need to visit the login page, click the 'reset password' link and type in their username. They will be emailed a link which will let them set a password.

As an administrator, you can also manually reset someone's password by clicking 'change password' in their user details screen.

> We recommend the adoption of a password wallet service like [1Password](https://1password.com/), [LastPass](https://lastpass.com) or built-in browser features to generate and store passwords. That lets passwords become much more secure and harder to guess whilst not requiring users to remember them.
>

### Notes about password security

Passwords must be a minimum of 8 characters.

When someone sets or changes their password, it's checked against https://haveibeenpwned.com/Passwords to ensure it's not a common one and is suitable for ongoing use.

Passwords are stored in our system [salted and hashed](https://www.okta.com/blog/2019/03/what-are-salted-passwords-and-password-hashing/) using the [bcrypt](https://en.wikipedia.org/wiki/Bcrypt) scheme, with 13 rounds. This means that we do not know what your passwords are and in the unfortunate event of our passwords database being hacked, the original passwords would still not be able to be retrieved.

### Two factor authentication
Users are strongly encouraged to set up two factor authentication (2FA) using an app. Unfortunately this is one step an administrator can't do for them, but luckily it is quick and easy to do: [here's how]({{<relref "2fa-setup">}}).

Users without 2FA will be prompted to do so in the user interface and by email.

2FA is mandatory for [administrators]({{<relref "#roles">}}) and necessary for a user to have before [manage]({{<relref "/docs/security-and-compliance/security-features/privileges">}}) privileges can be assigned to them. Users also need to have 2FA enabled in order to perform certain functions such as exporting to spreadsheet.

When enabled, a user will be prompted for the 2FA code as well as their password when they log in from a device or location they haven't used in the past 30 days.

If a user encounters any problems with 2FA, e.g. they lose the device for generating their codes, you can temporarily disable 2FA on their account by going to their user details screen and un-ticking 'use 2FA'. Of course, you need to be aware of the risks, for example double checking that a user who contacts you is really who they say they are. Once they can log in, they'll be able to enable 2FA themselves again.

#### Mandating 2FA for everyone
This can be done in the [company settings]({{<relref "/docs/advanced-usage/company-settings#mandate-2fa" >}})

### Other options
#### Use the custom AgileChilli UI rather than Agilebase's
It's possible for companies to apply their logo and custom login screen to the system. Please contact us if you'd like to set this up.

#### Logout after
Automatically end the user's session after after this many minutes of inactivity. The user themselves can also change this setting.

#### Restrict data access
Here, you can specify a field name, either an equals or a contains filter and a value. The button _set to user ID_ will set the value to the user's ID.

The purpose of this is to limit the data rows a particular user sees in a view. If a field with the name you specify appears in a view, a filter will be automatically applied so the user only sees rows which match the filter.

For example, if you set `created by [auto] = Oliver Kohll (oliver@agilechilli.com)`, then (assuming `Oliver Kohll (oliver@agilechilli.com)` is their username), the user will only see records they created, as long as the 'created by [auto]' field appears in the view.

A similar feature exists to add filters to roles - useful when you may want to apply the same filter to multiple users. See [roles]({{<relref "roles#multi-tenanting">}})

#### Roles
Tick a role to assign the user to it. The primary purpose of roles is to apply privileges to groups of users, see [roles]({{<relref "roles">}}) for more information.

There's one special role which can be assigned. It will be marked **grants administrative privileges**. Assigning that role will make a user an administrator, with full permissions over the complete system. They can create/remove users, roles, tables etc., as well as assign themselves privileges on any table.

Next to each role listed is a list of tiles that will be added to their screen if that role is assigned to them. This is a convenience feature to speed up setting up their home screen. The tiles shown for a role are those which more than half of the members of that role have. Tiles can be manually added and removed by an [administrator] or the user themselves.

If any role is a [filtering role]({{<relref "roles#multi-tenanting">}}), the filter applied is also displayed.

#### Privileges
Assign individual table [privileges]({{<relref "privileges">}}) to a user.
> When dealing with larger numbers of users it's usually more manageable if you use roles to assign privileges.

If a user has a privilege due to being a member of a role, that privilege is shown with a shaded blue background. Any additional privileges individually assigned to them are shown in green.

#### Tiles
Allows an admin to add/remove [tiles]({{<relref "/docs/tiles">}}) for a user. By default users can add/remove tiles themselves too, although this can be disabled through the use of a [custom UI]({{<relref "#other-options">}}).

## Viewing users
From the homepage, [toggle development mode on]({{<relref "/docs/introduction/development-mode">}}) and click the 'users' box at the top right. You'll see a list of existing user accounts. Their details are listed including 2FA status (whether they're using app-based 2FA or not) and when they last logged in.

Each user's roles are shown. Any [multi-tenanting]({{<relref "roles#multi-tenanting">}}) roles are also included.

> The list of users can be exported to spreadsheet by clicking again on the 'users' box at the top right of the screen. 

## Removing users
To remove a user, click one in the list (see above) to open the user editing panel. At the bottom, click the Remove button.

A user removal will have no effect on any data stored in the system. The user's previous comments will still be visible for example and their username will still be logged against any records they're marked as owner of. Their changes will still be in the audit trail and they will be marked as the creator/last editor of records where relevant.

You may want to take some other actions after deletion e.g. to re-assign records they are assigned to.

A deleted user's profile image will be replaced with a standard icon representing a deleted user, when displayed in comment streams etc.



