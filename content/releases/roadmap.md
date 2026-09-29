---
title: "Roadmap"
date: 2026-09-29T09:45:55+01:00
type: docs
weight: 30
description: What will be coming up for Agilebase?
---
Agilebase is constantly being updated with many minor improvements and bug fixes. Pretty much every week we release some new changes to our test systems, which get packaged up into final releases to customers once tested.

However, there are some longer term threads that are more planned than reactive.

Recently, we've released passkey support, which is one of those.

Currently, we're planning out the major elements of how our MCP server will evolve. That's the feature which gives AI agents the ability to retrieve and store data in Agilebase.

The MCP server does work and customers are using it effectively. (If you're not already, please give it a go and let us know what you think, so you can inform future development). However we've been consulting widely amongst customers and outside experts and it's clear that some further development could make it even more useful.

Our planned items are:

## Authentication mechanism changes
Currently, to use the MCP server, you have to use a secret API key (provided by Agilebase). This is perfectly secure, but it doesn't allow different people to use the same MCP server and apply their privileges.

If we used a different mechanism called OAuth, we would be able to get the person using or setting up an AI chat or agent to authenticate as themselves. The agent would then take on their permission levels and privileges and wouldn't be able to do anything that the particular person themselves couldn't do