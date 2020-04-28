---
title: "Users"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 10
description: Adding, viewing and removing users
---
# Adding a user
1. Expand the _Administration_ menu in the lefthand sidebar
2. Click _users_. You'll see a list of existing users
3. Click the plus button in the toolbar at the top
You should now see an editing screen with the details of the user you just created.
![User editing](/user-details.png)
You can enter the user's name and username. If the username isn't their email address, enter their email address in the field provided too. This is useful
* to allow them to reset their own password by receiving a link by email
* to allow them to receive notifications when another user adds a comment against a record
* as various features allow a user to be assigned to a record. Workflows can be set up to email those users. E.g. if an account manager is assigned to a customer, you may want to email them when a complaint is received from that customer.
## Passwords
The recommended way to set passwords is for the user to choose their own, which they can do once they have a username and email address filled in. They will need to visit the login page, click the 'forgotten password' link and type in their username. They will be emailed a link which will let them set a password.
As an administrator, you can also manually reset a user's password by clicking 'change password' in their user details screen.
Passwords are required to be at least 8 characaters long. Apart from that, there are no rules. However, all passwords entered are checked against the https://haveibeenpwned.com/ website. Any password that is found in their database of 'breaches' is not allowed to be used.
> We recommend the adoption of a password wallet service like [1Password](https://1password.com/), [LastPass](https://lastpass.com) or built-in browser features to generate and store passwords. That lets passwords become much more secure and harder to guess whilst not requiring users to remember them.
>

## Two factor authentication
Users are strongly encouraged to set up two factor authentication (2FA) using an app. Unfortunately this is one step an administrator can't do for them, but luckily it is quick and easy to do: [here's how](https://todo.com)
Users without 2FA will be prompted to do so in the user interface and by email.
When enabled, a user will be prompted for the 2FA code as well as their password when they log in from a device or location they haven't used in the past 30 days.
If a user encounters any problems with 2FA, e.g. they lose the device for generating their codes, you can temporarily disable 2FA on their account by going to their user details screen and un-ticking 'use 2FA'. Of course, you need to be aware of the risks, for example double checking that a user who contacts you is really who they say they are. Once they can log in again, they'll be able to enable 2FA themselves again.
If someone can't use app-based 2FA for some reason, then a fallback option is to use text-message (SMS) based authentication. This is not recommended as there are known insecurities in this method, but it's still better than having no 2FA at all. To enable that, just type in the user's mobile phone number when editing their user details. That phone number isn't used for any other purposes.
# Viewing users

