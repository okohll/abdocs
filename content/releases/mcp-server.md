---
title: "21st September 2026 - MCP servers and Passkeys"
date: 2026-09-19T09:57:55+01:00
type: docs
weight: 40
description: Two beta features - MCP servers for AI interactions, Passkeys for more secure logins
---
This release includes a couple of major features for you to try out.

The release will be rolled out gradually over the next few weeks, customer test servers first.

## MCP server
> This is currently in beta testing, which means it's not recommended to roll them out across your entire organisation yet, but feature is complete and works, so administrators can use and test.

The addition of an MCP server functionality to Agilebase brings a powerful new capability for AI agents and people to interact with your system from outside it. In fact, you can connect up many different systems, if they have their own MCP servers, to transfer data intelligently between them or synthesize it.

This feature in particular will evolve further over time but you can already use it to accomplish useful work.

To get started, you'll need a Mistral AI account (other systems will be supported over time). Please see the [documentation]({{<relref "/docs/artificial-intelligence/mcp-servers" >}}) for how to set things up.

## Passkeys
Passkeys are a replacement for passwords. After enabling, you can log in to your system with a quick biometric check - whatever your device supports, be that a fingerprint reader, face scan or something else.

If you find passwords and Two Factor Authentication codes a hassle, passkeys are for you!

They are both more convenient and more secure, as explained by the UK government's National Cyber Security Centre, which recommends their use whenever possible.

https://www.ncsc.gov.uk/passkeys

Passkey technology first came to our attention back in 2017, as a technology concept (when it was called webauthn). However it's only recently that support has been complete enough in all browsers to allow seamless use without some people running into problems.

It's also only recently become possible to easily and securely migrate and stored passkeys from one system to another. Until that, if you set up your login on say a Microsoft system, you couldn't then move to Apple. We weren't happy asking customers to lock themselves in to any one particular vendor, so waited until that was solved before releasing.

We recommend that system administrators test this facility e.g. on their own accounts so they become comfortable with how it works, before rolling out more fully throughout their ornganisations.

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

## Other

Many other incremental improvements and bugfixes have been implemented since the last release. To see all of them, please take a look at

https://github.com/agileChilli/Agilebase-updates/issues?q=is%3Aissue%20state%3Aclosed

If you don't yet have access to that as a customer, please let us know.