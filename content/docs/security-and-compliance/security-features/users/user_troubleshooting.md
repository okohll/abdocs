---
title: "Login troubleshooting"
date: 2024-07-31T08:52:00+01:00
type: docs
weight: 100
description: Helping people who have problems logging in
tags:
- Software Architect
- v6
---
As a software architect in charge of the Agilebase system for your organisation, 
you may be called on to help people who have forgotten their password, or are having problems logging in for another reason.

Here are a few things you can do and check to help them get back in.

## Precursor
Firstly, if anyone reports login issues, make absolutely sure that it is really them requesting help. There are unfortunately an increasing number of ways that malicious people try to gain access to systems, so have a process to check.

## Initial Checks
### Username and password checks
It may seem obvious, but the first check is that the username and password is indeed what they think it is. Remind them that both usernames and passwords are case sensitive.

As an administrator you can check usernames (but not passwords) in the [user list]({{<relref "/docs/security-and-compliance/security-features/users" >}}).

## Login URL
Some customers may have more than one system e.g. test or development systems as well as the live. Make sure that they are trying to log in at the correct URL. The default URL for live systems is https://www.agilebase.co.uk

## Lockouts
If someone tries to log in with an incorrect password more than a certain number of times, they'll be locked out. Ask them to wait 5 minutes and try again.
Alternatively, you can temporarily change their username, or reset their password.

## Disabled Users
If a user hasn't logged in for a long time, the system might automatically disable them.
As an administrator, to check if that's the case, you can view their user details. If they are disabled, you can un-tick the _disabled_ option to let them in.

## Resolutions
### Password resets
If none of the above work, ask the user to do a password reset from the login page. They will get an email with a link to let them change their password.

If that fails or they can't do it for some reason, you can manually assign a password by editing their user details. However, please ask them to set their own password once they do manage to log in, from their profile, accessible from their user menu at the top right of the screen.

### Two Factor Authentication (2FA)
Sometimes people can e.g. set up 2FA on phones, then replace their phone and lose the codes.

Users can't disable their own 2FA once enabled, but an administrator can edit their user details and un-tick the _use 2FA_ option.

The user will be asked to set up 2FA again the next time they log in.

## Future recommendations
> We strongly recommend the adoption of a password wallet service like [1Password](https://1password.com/), [Bitwarden](https://bitwarden.com) or built-in browser features to generate and store passwords. That lets passwords become much more secure and harder to guess whilst not requiring users to remember them.

Some of those apps can also store 2FA codes making the login process more convenient and protecting against losing 2FA devices.