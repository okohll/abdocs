---
title: "Scaling potential"
date: 2020-06-22T09:57:55+01:00
type: docs
weight: 50
description: Scaling applications as an organisation grows
---
Using agileBase you can start small (perhaps in one team or department) and build apps iteratively to encompass a constantly widening range of business requirements. Many back office and CRM systems don't typically store high volumes of data, but as systems grow its not uncommon to add transactional apps such as customer order processing for example, which can experience high throughput.

agileBase supports all three stages of an organisation's lifecycle - startup, scaling and growth. As a startup, development speed and flexibility are key, during scaling efficiency becomes important and as a large organisation, control, robustness and trust come to the fore. We'll explain how each of these is covered.

## Database - PostgreSQL
Firstly, at a technical level, agileBase is well covered to support large volumes of data and numbers of transactions per second (TPS) whilst remaining highly responsive for users.

The underlying database used to store data is [PostgreSQL](https://www.postgresql.org), "the world's most advanced open source database". It has a strong reputation for reliability, feature robustness, and performance.

Our monitoring systems ensure reliable performance under load. Customers routinely build apps which store and process tens of millions of data rows. Should there be a need to expand to larger amounts, there's always the option to upgrade a customer database to larger servers or distributed 'hyperscale' systems, such as [Citus Data](https://www.citusdata.com/), which works with PostgreSQL.

## Engine - API Creator
Typically, higher data processing volumes occur not when users are entering data, but when third party systems are connected via the API, which can feed in or extract data from high-volume sources such as websites or financial systems. The [API Creator]({{<relref "/docs/integrations">}}) allows this to be done easily.

## Adoption
As agileBase use migrates from one group of people to another throughout an organisation, a project manager or architect's concern moves from the 'is it technically possible?' question, to 'is it going to be successful?'

Over and over again we find that successful software implementations occur when users are happy. Frequently, agileBase users evangelise the system to their colleagues and help grow the internal user base. There are a couple of reasons for this. Firstly, the user interface is friendly - not only easy to use but attractive and colourful. It sounds simple but it makes a world of difference. 

The user interface is also consistent from app to app - whatever the function of the app, the same look & feel & layouts are used, reducing training requirements and letting users support each other.

Secondly, as agileBase is a low code / no code platform, users can be involved from the very beginning. If a project is managed well, their input will be quickly actioned in a working prototype - people then feel they have a stake in the final application, resulting in engagement and buy-in.

To aid adoption by new users, agileBase allows an administrator to [enter help content]({{<relref "/docs/adding-help">}}) and links into many different places of the user interface, down to the individual field level. We highly recommend some time is spent doing this as applications are built.

## Partners
We have a growing network of partners, with lots of experience and skills in consultancy, project management and development using agileBase. Larger projects and companies may well want to take advantage of this range of abilities, e.g. to run planning, development workshops and training events.

## Security, privacy and control
As systems grow, it's important that a level of control is exercised over who accesses which data, how and when, particularly when sensitive personal information is stored, or core data central to the running of a company.

In a low code / low code environment such as agileBase's, an additional factor is controlling the evolution of the system. Too centralised and innovation can slow, too relaxed and it can run out of control.

All of these factors are taken into consideration when we design the administrative features that help decision makers set the rules for application development. The [Security and Compliance]({{<relref "/docs/security-and-compliance">}}) section of the documentation covers many of these. This is also an area of ongoing research and development - our [roadmap blog post](https://blog.agilebase.co.uk/2019/12/10/agilebase-platform-vision-2020-from-startup-to-scale-up-without-screwing-up/) details some of the current thinking.

## Cost
An easily understandable, fair and transparent pricing policy means that annual costs can be reliably estimated for any future growth scenario, in fact multiple scenarios can be planned - nothing is hidden! See the [costing](https://todo.com) section for more details.
