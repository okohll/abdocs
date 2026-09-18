---
title: "21st September 2026 - MCP servers and Passkeys"
date: 2026-09217T09:57:55+01:00
type: docs
weight: 40
description: Two beta features - MCP servers for AI interactions, Passkeys for more secure logins
---
This release includes a couple of major features for you to try out.

> They are both currently in beta testing, which means it's not recommended to roll them out across your entire organisation yet, but they are complete and work, so administrators can use and test them.

## MCP server
The addition of an MCP server functionality for Agilebase brings a powerful new capability for AI agents and people to interact with your system from outside it. In fact, you can connect up many different systems, if they have their own MCP servers, to transfer data intelligently between them or synthesize it.

This feature in particular will evolve further over time but you can already use it to accomplish useful work.

To get started, you'll need a Mistral AI account (other systems will be supported over time). Please see the [documentation]({{<relref "/docs/artificial-intelligence/mcp-servers/"/>}}) for how to set things up.

## Passkeys
Passkeys are a replacement for passwords. After enabling, you can log in to your system with a quick biometric check - whatever your device supports, be that a fingerprint reader, face scan or something else.

They are both more convenient and more secure, as explained by the UK government's National Cyber Security Centre, which recommends their use whenever possible.

https://www.ncsc.gov.uk/passkeys

Passkey technology first came to our attention back in 2017, as a technology concept (when it was called webauthn). However it's only recently that support has been complete enough in all browsers to allow seamless use without some people running into problems.

It's also only recently become possible to easily and securely migrate and stored passkeys from one system to another. Until that, if you set up your login on say a Microsoft system, you couldn't then move to Apple. We weren't happy asking customers to lock themselves in to any one particular vendor, so waited until that was solved before releasing.

We recommend that system administrators test this facility e.g. on their own accounts so they become comfortable with how it works, before rolling out more fully throughout their ornganisations.

## Other

Many other incremental improvements and bugfixes have been implemented since the last release. To see all of them, please take a look at

https://github.com/agileChilli/Agilebase-updates/issues?q=is%3Aissue%20state%3Aclosed

If you don't yet have access to that as a customer, please let us know.