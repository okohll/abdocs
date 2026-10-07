---
title: "Passkeys"
date: 2026-10-07T16:40:00+01:00
type: docs
weight: 10
description: Using passkeys for security and convenience
tags:
- Core User
- v6
---
## What is a passkey?

Passkeys are a replacement for passwords. After enabling, you can log in to your system with a quick biometric check - whatever your device supports, be that a fingerprint reader, face scan or something else.

If you find passwords and Two Factor Authentication codes a hassle, passkeys are for you!

They are both more convenient and more secure, as explained by the UK government's National Cyber Security Centre, which recommends their use whenever possible.

https://www.ncsc.gov.uk/passkeys

## How long does this take to set up?
No more than a minute. If it's required by your company, you will be prompted to automatically - just follow the prompts.

If not,
1) click your user icon at the top right of the screen
2) click on 'profile'
3) go to 'security' and press the 'register passkey button'

Your computer will ask you to verify your identity with its usual mechanism e.g. biometrics like a fingerprint.

From then on, you can log in without a password by pressing the 'login with passkey' button on the login screen.

### Passkey FAQ

#### What happens if I lose my passkey?
Firstly, passkeys are a lot harder to lose that other authentication methods. 2FA for example, can sometimes be wiped if you change your phone (if you use a phone app to store codes). Passkeys on the other hand are supported at the operating system level, i.e. stored at a low level in your account for your device, e.g. in your Apple, Google or Microsoft account, or in a third party password wallet if you use that.

But it's certainly possible for them to become unavailable, if e.g. you switch operating system and don't consciously copy them across.

If that happens, an administrator can recreate the user account for the individual. We recommend the process:
1) Alter the person's username, e.g. add **_old** to the end of it.
2) Clone that user - for the new user account, specify the username of the original user
3) Delete the old user account

They will then be able to set up a new passkey.

#### What if I want to log into a computer or device I don't usually use, e.g. someone else's?
This is discouraged from a security point of view, but it is possible if your passkey is available on your phone, which it will be by default for the major systems, i.e. Apple, Google etc., or if you use a third party password wallet and have the app on your phone.

In that case, when you press the 'login with passkey' button, you'll be shown a QR code which you can scan with your phone.

#### If I have a passkey can I still use my username and password?
In the short term, yes, you can use either method to log in. In the long term, people with passkeys will only be able to log in with that method, to take advantage of the increased security.
