---
title: "Views"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 50
description: Views allow the user to search and manipulate data
---
Along with [tables]({{<relref "docs/tables/relational-database-concepts">}}), views are one of the two foundational concepts used when building applications with agileBase.

## What is a view?
In fact, the concept of a view is not unique to agileBase, it is a core part of any database system, including the [PostgreSQL](https://www.postgresql.org) database that agileBase uses to store, manipulate and report on data.

Here are some of the advantages a view can offer, as explained by the [Wikipedia Article on database views](https://en.wikipedia.org/wiki/View_(SQL)), slightly shortened.
* Views can represent a subset of the data contained in a table.
* Views can join and simplify multiple tables into a single virtual table.
* Views can act as aggregated tables, where the database engine aggregates data (sum, average, etc.) and presents the calculated results as part of the data.
* Views can hide the complexity of data

In a nutshell, creating a view in agileBase allows you to display information to the user in an easily searchable format. A single view of data can contain fields from many different places placed alongside each other. It can be filtered down to a subset, and/or contain summarising data like counts, totals or averages.

Views can utilise the full power of the SQL language (mostly behind the scenes with complexity hidden from administrators) to create useful and advanced reports where necessary.

On the screen, a view is most usually output as a series of rows of data, with field names as column headings - like a spreadsheet. 

**TODO: screenshot**

There are also other ways of displaying the output, such as in a [calendar](https://todo.com) or [document library](https://todo.com) interface.

Views are organised into [tiles]({{<relref "/docs/tiles">}}). Each tile contains a collection of views, organised into a menu system within it. Administrators can hence organise the display of data in a logical fashion.

### Behind the scenes uses
As well as showing data to users, the power and flexibility of views allows them to be used in a multitude of different ways useful for administrators. For example, in [workflow](https://todo.com) automations, to create [APIs](https://todo.com) to allow third party systems to query the data, or to control [hiding and showing fields]({{<relref "/docs/fields/field-options/common-options#show-if-record-in-view">}}).

There are many other uses we'll come across throughout this documentation, in fact almost every major feature depends on views in some way.

So it's a useful topic to understand comprehensively.

