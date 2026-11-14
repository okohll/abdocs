---
title: "Artificial Intelligence (AI)"
date: 2024-02-07T14:30:00+01:00
type: docs
weight: 15
description: How AI and No Code can work together in Agilebase
tags:
- Software Architect
- v6
---
## The AI connector
AI use in Agilebase is optional and controllable. It's disabled by default and can be enabled on a per-user basis by a software architect level user.

### Concept
Agilebase provides a connector that allows any third party AI interface to connect to Agilebase as an authenticated user. Someone using an AI chat interface like Chat GPT, Claude or Mistral, can ask Agilebase to look up information and take actions.

Almost any action the user themselves can take, can also be taken via the AI interface. That includes searching for and editing data, up to development of the system, building tables and views, if the user has those capabilities. There are some exceptions, notably all System Architect only features are excluded, such as setting privileges and adding or removing user accounts.

The connector is an [MCP server](https://mcpservers.org/learn/what-is-an-mcp-server).

### Control
The AI connector starts completely disabled. In order for someone to use it, a Software Architect must enable it for them individually.

For each user, the software architect can choose a level to allow. [Edit the user]({{<relref "/docs/security-and-compliance/security-features/users">}}) and set the AI privilege level
* view - the AI can only read data, not change it
* edit - records can be created and updated, but not deleted. That can only be done by someone directly logged in to Agilebase
* develop - work on the system, updating tables and views. Again, removing objects is excluded

The user's own privileges also apply. If the user can't see a table or view, the AI won't either. If they can't develop, the AI won't be able to.

### Data privacy
The choice of AI system to connect is critical. Once connected, the AI has access to all the data the logged in person using it does. You should check that the AI vendor is able to, and will protect your company data.

> Internally, we ourselves use [Mistral](https://mistral.ai). This is an EU owned and hosted service with strict GDPR controls.

### Connecting
Once a Software Architect has enabled someone's AI access to one of the levels above, they can connect a third party AI.

In the AI's settings or configuration, add a custom connector, sometimes called an MCP server.

You only need to specify one thing, the URL of the Agilebase MCP server, which is

https://[subdomain].agilebase.co.uk/agileBase/mcp

where [subdomain] gives the address of your system. Usually it's your company name, lowercase with spaces removed.

On connecting, the user will be sent to an Agilebase page which asks if they want to allow the third party system to connect with their privileges. Here they can choose the maximum privilege level to allow the AI - **view**, **edit** or **develop**, up to the maximum privilege they have as a user and the maximum the Software Architect has enabled for them.

If you want to later change that selection, please disconnect and reconnect the connector, or MCP server, in the third party software.

### Usage
Once connected, simply chat to the system. Use the word Agilebase to prompt the connector. For example, 'What are the project statuses in Agilebase?' or 'In Agilebase, how would I create a report to show monthly sales totals?'

### Disconnecting
When a user logs out, any AI sessions are disconnected too. The same happens if the user is disabled, deleted or if their password is changed.

## AI workflows
[AI workflows]({{<relref "/docs/workflows/ai-workflows">}}) allow AI to work in the background, modifying your data in bulk in an automated fashion. These can create or update records, merging existing data into prompts.

Examples could be
* letting people enter basic details for records (sales enquiries, time logs etc.) and letting the AI automatically categorise and add metadata in the background
* when a new field is added to a table, update all historical records to set sensible values for it
* summarising large amounts of data or extracting key points for reporting


