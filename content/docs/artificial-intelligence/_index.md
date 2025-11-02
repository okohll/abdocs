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
AI is used in many core features of Agilebase: to give you ideas about what to build, help to build those systems and build more advanced features more quickly than you would be able to do on your own as you progress your learning.

It's possible, with a few simple prompts, for Agilebase's AI to build a complete system for you from scratch, for whatever you want (a CRM system for a charity, an asset tracking system for a film production company, or whatever you want to describe).

{{< youtube sBYr8Sf6hAI >}}

Then when fleshing it out, the AI can help with more complex tasks like adding calculations for reporting.

However, AI isn't a replacement for your own understanding, more of an aid. It's always a good idea to have some knowledge of the principles of how database systems work and Agilebase in particular - [relational database concepts]({{<relref "/docs/tables/relational-database-concepts">}}) is a good starting point.

## Getting Started
See [Using AI to add multiple tables]({{<relref "/docs/tables/adding-and-removing#using-ai-to-add-multiple-tables">}}) as the starting point for building a complete system, or extending an existing system with new applications

## Private AI

Where AI features are available in Agilebase, EU AI providers bound by strict GDPR regulations are used. Contractually, data is never shared or used for model training purposes.

Whenever you use AI features, which are marked with a 'sparkles' icon and the word AI inside a button, the prompts that you provide, along with other information from the Agilebase system (explained in the documentation for each feature) is sent to the AI.

For example, when you 
* [create a system]({{<relref "/docs/tables/adding-and-removing#using-ai-to-add-multiple-tables">}}) - the prompt you provide, plus a list of existing tables in the system is sent
* [add fields to a table]({{<relref "/docs/fields#adding-fields-automatically-using-ai">}}) - the prompt you provide, plus a list of existing tables in the system is sent
* [create a calculation]({{<relref "/docs/views/calculations#using-the-ai">}}) - the prompt you provide, plus a list of existing fields in all joined tables/views, is sent
* [create a chart]({{<relref "/docs/charting/built-in-charting">}}) - the chart description you provide, the view name and a list of fields in the view is sent

### Self hosted models
Should you wish, you can [configure your organisation settings]({{<relref "/docs/advanced-usage/company-settings">}}) to use your own choice of AI, including self-hosted models to ensure traffic never leaves your own controlled infrastructure.