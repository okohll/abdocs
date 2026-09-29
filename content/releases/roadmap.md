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

## 1) Authentication mechanism changes
Currently, to use the MCP server, you have to use a secret API key (provided by Agilebase). This is perfectly secure, but it doesn't allow different people to use the same MCP server and apply their own privileges. Which means the MCP server has to be carefully designed and shared appropriately.

If we used a different mechanism called OAuth, we would be able to get the person using an AI chat or agent to authenticate as themselves. The agent would then take on their permission levels and privileges and wouldn't be able to do anything that the particular person themselves couldn't do.

So that's the first item, which then allows a solid foundation of data security to build on.

## 2) Discoverability vs design
Currently an administrator has to specifically choose which tables and views from Agilebase are made available to outside AI - due to the permissions mechanism described above.

However when we have OAuth, we can open up a lot more power by giving agents access to everything in Agilebase that the person using it has available. The paradigm changes from 'allow only specifically chosen areas', to 'allow the AI to discover what it needs to carry out a particular task. It can see how tables are connected together to infer what it might need to do. For example, if asked to add an organisation and contacts, it can find out that organisations and contacts are connected via site addresses, therefore a site address needs adding too. (If of course they are in your system, that's just an example).

If asked to find turnover data, it will be able to search the entire list of views in the system and verify for those it finds, where the turnover data comes from, by examining the view structure. This checking should produce more reliable answers.

A discovery mechanism will also let the AI be a much more useful development assistant. It will be able to check how the structure works - which joins a view has etc., if say you ask it to explain a workflow or change a view.

## 3) Skills
Inference only gets you so far. Some processes which your organisation carries out need to be explained. Maybe you have how-tos, process maps or guides for new employees in particular roles. This idea is similar. In fact, if you do have that documentation, it can be re-purposed..

We will therefore add the ability for you to specify your own set of 'skills', as they're called in AI land. Each one can tell the AI in detail the steps necessary to accomplish any particular task. So for example if you add a new customer, you might require that the organisation has a contact marked as 'accounts payable' with a valid email address - just as one step amongst many.

## 3) Meaning
There are a number of terms floating about in the field of AI to add understanding of your particular work, as opposed to 'the average case' which AI defaults to. For example, in your organisation, your accounts dept. may have a particular way of amortising invoices over past or future months, or you may use your own jargon for parts of a process. In order to give you back valid answers, the AI would have to understand all the little details.

Briefly, the ways to ensure your own specific meanings get through are to do with ontologies, knowledge graphs or taxonomies and semantic layers. There are many people who are trying to develop best practices and get to grips with how to make the knowledge embedded in your business usable by AI.

For this and indeed for all of the above themes, we don't necessarily need to build all the tools in-house. There are many options, often open source - which we can utilise if necessary. Either way, we and the world are constantly evolving particularly on the last topic of meaning. We will continue to follow our philosophy of thinking carefully about solutions but putting out working options frequently in an agile fashion.

We look forward to what the coming year brings and hope you join us on trying out new things as they become available!