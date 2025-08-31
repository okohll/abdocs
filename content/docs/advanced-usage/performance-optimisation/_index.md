---
title: "Performance Optimisation"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 130
description: Working with big data and complex views
tags:
- Software Architect
- v6
---
Agilebase automatically takes some measures behind the scenes to maintain high performance as data volumes grow. And the underlying PostgreSQL database is pretty good at running queries very quickly.

As your system matures, you may find there are tweaks you can make to keep it running fast so that there's a good user experience.

## What can cause slowdowns?

If anything seems to be running a bit slow it will almost always be down to the performance of a view. Views can involve lots of data and complex calculations. Also lots of things depend on views, some examples (a non-exhaustive list):
* obviously opening a view itself in a tile and searching it
* opening a record can be affected if
  * it has referenced fields embedded in it (to show charts or data for example)
  * there are visibility rules on fields (which depend on views)
  * a workflow view is set to run every time a record is opened
* showing charts (which get their data from views)
* making a call to an API view

A fuller list can be seen at [view special uses]({{<relref "/docs/views/special-uses">}}).
