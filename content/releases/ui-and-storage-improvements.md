---
title: "14th May 2026 - more UI improvements, storage changes and coming up"
date: 2026-05-14T09:57:55+01:00
type: docs
weight: 50
description: Pinning and other UI improvements, file storage and new features in development"
---
## Pinning persistence
Last month's release of the ability for users to pin views (i.e. keep favourite views permanently and easily accessible) went down well with customers and we had some great feedback.

One request was to keep pinned views around between logins and other events, like platform upgrades. That's now done.

> Reminder - To pin a view, simply open in and click the pushpin icon at the top left. Then it will stick to the sidebar on the homepage, so you can click it to get back to it at any time. It will also appear at the top if you click the magnifying glass 'search' icon in the top toolbar.
>
> You can also use that search to find any view in the system, whichever tile it's in.

## File storage improvements
This one's a bit behind the scenes, but the mechanism for storing documents which you might create or upload in Agilebase has been modernised.

Files have been moved from a datacentre in London, run by a US company, to one in Manchester run by a UK owned organisation. Those of a technical bent might like to know that the technology has also switched from ZFS to S3.
That modernisation allows us to keep storage costs at reasonable levels but also means we can be confident that GDPR protections are practically enforced, not just 'on paper'.

There will be more info about how our general approach to data security is evolving to meet new demands soon, but suffice to say it is always at the front of our minds and we want to be always a step ahead of what our customers are asking us for.

## Coming up
We've been increasing the number of people involved with Agilebase development, including coding, but also bringing in analysis skills, brainstorming and area specialists.

We're very grateful for all the help we've received. Here are some exciting improvements coming to the platform as a result.

### Allowing AI agents
Agilebase has some powerful AI workflow capabilities built it. There are some great examples of customers using it to run AI in a repetitive way on masses of data - cases where there's too much to give a person to do in any reasonable amount of time.

That's fine if all of your data is already in Agilebase, but what about when you want to allow external agents access to many tools, including but not limited to Agilebase?

The solution to that is called an MCP server. What it does is give an external AI agent of your choice the ability to perform actions in Agilebase as if it were a user. For example, creating or updating records, or viewing data.

So for instance, a B2B food company could keep an eye on an email inbox set up for customer requests and automatically set up samples to send or recipe customisations in Agilebase when relevant.

> In implementing our system, we've been careful to design it for minimal AI token use. Lots of systems around are very inefficient and profligate with what they send to AIs, because at the moment it doesn't really matter from a cost perspective.
> However, here again we want to be ahead of the market. We believe that utilising large language models (AI) is going to become significantly more expensive and efficiency will become an important factor.

Thanks to Tim Robinson for helping us work through the ideas here.

### Glossary
In larger organisations and systems which have been evolved over a long time, your own internal language builds up - acronyms, phrases and words used with a particular meaning with regard to your specific business purposes.

We're building tools to let you define, enforce and see those definitions wherever they're used in the system. So understanding is shared across all people, including new users of a system.

What this looks like in practice will become clear - we will test all new features internally before making them widely available, but if you want an input during the development phase please do get in touch with your thoughts.

Thanks to Natalie Watts for working with us in this area.

### Business Intelligence
We have some projects in the pipeline for looking at [data warehouseing](https://en.wikipedia.org/wiki/Data_warehouse), a step beyond the direct use of [Business Intelligence]({{<relref "/docs/charting/business-intelligence">}}) tools.

We don't yet know how that may pan out, but if there is anything that could be useful to any or all Agilebase customers, we will keep you posted.

## Everything else
Since the last release on the 3rd April, there have been 25 improvement ideas implemented and issues fixed, including the main features above. Customers and partners can see the full list at

https://github.com/agileChilli/Agilebase-updates/issues?q=is%3Aissue%20state%3Aclosed