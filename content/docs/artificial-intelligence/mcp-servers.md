---
title: "MCP servers"
date: 2026-09-07T14:30:00+01:00
type: docs
weight: 30
description: Setting up MCP servers to allow you to interface with Agilebase via chat interfaces
tags:
- Software Architect
---
In Agilebase you have the ability to easily [create MCP servers]({{<relref "mcp-servers"">}}). What is an MCP server? The acronym's not very helpful, as per many tech. acronyms (it stands for Model Context Protocol), but in simple terms it means you can connect up a standard third party AI chat interface, like ChatGPT, Claude or Mistral, with Agilebase and query your system with natural language.

So for example you can ask the system a question and it will look up information from views, or you can ask it to do something like add a note to add a new person to the database.

The full power comes because MCP is an industry standard, which means you can not just connect Agilebase, but via one chat interface, connect many different systems. So for example, it could monitor an email inbox, to triage, categorise and create support tickets, sales enquiries etc. in Agilebase.

> This feature is currently in beta testing and will evolve over time.
> In particular, you will currently need a Mistral AI account to make use of it. In time, other chat interfaces will be supported.

## Planning
You can actually create many different MCP servers as you see fit, each one designed for a particular purpose. Allowing access to all of Agilebase through a single MCP server would likely be overwhelming for AI software connecting to it - there's just too much you can do. Aside from which that wouldn't be a particularly good idea from a security perspective. Different datasets likely have different rules for who can access them. Finally, separate tightly focussed MCP servers allow for the use of smaller, more cost effective and energy efficient AI models (LLMs).

There are two things that the MCP server can do with Agilebase data
1) work with individual records i.e. add new records or update existing ones (but not delete them)
2) search and retrieve data from views by filtering, just like you would in the normal user interface

First of all then, decide on a purpose. For this documentation, let's assume it's to let people add timesheet entries.

Given that purpose, decide on the tables and views to give access to. For our timesheets, we'll obviously need to give it access to a timesheets table itself, so entries can be added. Depending on how your system's been designed, it might also be useful to give it access to others.

As for views, a view of current projects in progress might be useful, so each timesheet entry can be attached to one (but not completed or cancelled projects), a view of customers who can be similarly attached etc.

## Configuring
Once you know what you want to do, setting everything up is straightforward, just a couple of steps.

1) From the homepage, click your user icon at the top right of the screen and load the Profile page
2) Under 'Organisation Settings', scroll down to 'MCP server API key' and tick Enable. It will generate and show an API key for you to log securely
3) Finally, simple tag each table and view you decided on above with the same tag, e.g. 'timesheets' for our example

That's the Agilebase side done. Now if you go to the development homepage (toggle development mode from the homepage), it will show the name of your MCP server in the centre of the screen with a URL for it. You can use that in your Chat interface.

For instructions on how to set up Mistral AI. see

https://docs.mistral.ai/en/vibe/work/connectors/mcp-connectors

> Other systems will have similar help. We will add links to more when supported and tested.


