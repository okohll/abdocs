---
title: "Artificial Intelligence (AI)"
date: 2024-02-07T14:30:00+01:00
type: docs
weight: 15
description: How AI and No Code work together in Agilebase
tags:
- Software Architect
- v6
---
AI use in Agilebase falls into three categories. In all cases, use is optional. By default EU AI providers bound by strict GDPR regulations are used. Contractually, data is never shared or used for model training purposes. Please contact us if you wish to use your own privately hosted models.

## 1) Development
[AI can aid you]({{<relref "ai-development">}}) in creating a system from scratch, or adding functionality, particularly when it comes to more complex things like SQL calculations.

## 2) AI workflows
As well as working *on* the system, you can put AI to work *in* the system as well, modifying your data in bulk, with [AI workflows]({{<relref "/docs/workflows/ai-workflows">}}). These can create or update records, merging existing data into prompts.

Examples could be
* letting people enter basic details for records (sales enquiries, time logs etc.) and letting the AI automatically categorise and add metadata in the background
* when a new field is added to a table, update all historical records to set sensible values for it
* summarising large amounts of data or extracting key points for reporting

## 3) Chat interface
In Agilebase you have the ability to easily [create MCP servers]({{<relref "mcp-servers">}}). What is an MCP server? The acronym's not very helpful, as per many tech. acronyms (it stands for Model Context Protocol), but in simple terms it means you can connect up a standard AI chat interface with Agilebase and query your system with natural language.

So for example you can ask the system a question and it will look up information from views, or you can ask it to do something like add a note to add a new person to the database.

The full power comes because MCP is an industry standard, which means you can not just connect Agilebase, but via one chat interface, connect many different systems. So for example, it could monitor an email inbox, to triage, categorise and create support tickets, sales enquiries etc. in Agilebase.

