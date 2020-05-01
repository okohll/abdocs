---
title: "Users"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 10
description: Adding, viewing and removing users
---
## Adding a user
1. Expand the _Administration_ menu in the lefthand sidebar
2. Click _users_. You'll see a list of existing users
3. Click the plus button in the toolbar at the top

You should now see an editing screen with the details of the user you just created.
![User editing](/user-details.png)

You can enter the user's name and username. If the username isn't their email address, enter their email address in the field provided too. This is useful
* to allow them to reset their own password by receiving a link by email
* to allow them to receive notifications when another user adds a comment against a record
* as various features allow a user to be assigned to a record. Workflows can be set up to email those users. E.g. if an account manager is assigned to a customer, you may want to email them when a complaint is received from that customer.

### Passwords
The recommended way to set passwords is for the user to choose their own, which they can do once they have a username and email address filled in. They will need to visit the login page, click the 'forgotten password' link and type in their username. They will be emailed a link which will let them set a password.

As an administrator, you can also manually reset a user's password by clicking 'change password' in their user details screen.
Passwords are required to be at least 8 characaters long. Apart from that, there are no rules. However, all passwords entered are checked against the https://haveibeenpwned.com/ website. Any password that is found in their database of 'breaches' is not allowed to be used.
> We recommend the adoption of a password wallet service like [1Password](https://1password.com/), [LastPass](https://lastpass.com) or built-in browser features to generate and store passwords. That lets passwords become much more secure and harder to guess whilst not requiring users to remember them.
>

### Two factor authentication
Users are strongly encouraged to set up two factor authentication (2FA) using an app. Unfortunately this is one step an administrator can't do for them, but luckily it is quick and easy to do: [here's how](https://todo.com).

Users without 2FA will be prompted to do so in the user interface and by email.

2FA is mandatory for [administrators]({{< ref "#roles" >}}) and necessary for a user to have before [manage](https://todo.com) privileges can be assigned to them. Users also need to have 2FA enabled in order to perform certain functions such as exporting to spreadsheet.

When enabled, a user will be prompted for the 2FA code as well as their password when they log in from a device or location they haven't used in the past 30 days.

If a user encounters any problems with 2FA, e.g. they lose the device for generating their codes, you can temporarily disable 2FA on their account by going to their user details screen and un-ticking 'use 2FA'. Of course, you need to be aware of the risks, for example double checking that a user who contacts you is really who they say they are. Once they can log in, they'll be able to enable 2FA themselves again.

If someone can't use app-based 2FA for some reason, then a fallback option is to use text-message (SMS) based authentication. This is not recommended as there are known insecurities in this method, but it's still better than having no 2FA at all. To enable that, just type in the user's mobile phone number when editing their user details. That phone number isn't used for any other purposes.

### Other options
**Use the custom AgileChilli UI rather than agileBase's:**  
It's possible for companies to apply their logo and custom login screen to the system. Please contact us if you'd like to set this up.

**Logout after**  
Automatically end the user's session after after this many minutes of inactivity. The user themselves can also change this setting.

#### Roles
Tick a role to assign the user to it. The primary purpose of roles is to apply privileges to groups of users, see [roles](https://todo.com) for more information.

There's one special role which can be assigned. It will be marked **grants administrative privileges**. Assigning that role will make a user an administrator, with full permissions over the complete system. They can create/remove users, roles, tables etc., as well as assign themselves privileges on any table.

Next to each role listed is a list of tiles that will be added to their screen if that role is assigned to them. This is a convenience feature to speed up setting up their home screen. The tiles shown for a role are those which more than half of the members of that role have. Tiles can be manually added and removed by an [administrator](https://todo.com) or the user themselves.

If any role is a [filtering role](https://todo.com), the filter applied is also displayed.

#### Privileges
Assign individual table [privileges](https://todo.com) to a user.
> When dealing with larger numbers of users it's usually more manageable if you use roles to assign privileges.

If a user has a privilege due to being a member of a role, that privilege is shown with a shaded blue background. Any additional privileges individually assigned to them are shown in green.

#### Tiles
Allows an admin to add/remove [tiles](https://todo.com) for a user. By default users can add/remove tiles themselves too, although this can be disabled through the use of a [custom UI]({{< ref "#other-options" >}}).

## Viewing users
Expand the _Administration_ menu in the lefthand sidebar and click users. You'll see a list of existing user accounts. Their details are listed including 2FA status (whether they're using app-based 2FA, text message codes or none) and when they last logged in.

Each user's roles are shown. Any [multi-tenanting]({{<relref "roles#multi-tenanting">}}) roles are marked in bold.

## Removing users
To remove users, when viewing the list of users, tick those to remove and press the delete (cross) button in the top toolbar.

A user removal will have no effect on any data stored in the system. The user's previous comments will still be visible for example and their username will still be logged against any records they're marked as owner of. Their changes will still be in the audit trail and they will be marked as the creator/last editor of records where relevant.

You may want to take some other actions after deletion e.g. to re-assign records they are assigned to.

A deleted user's profile image will be replaced with a standard icon representing a deleted user, when displayed in comment streams etc.



