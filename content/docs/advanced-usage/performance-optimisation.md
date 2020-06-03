---
title: "Performance Optimisation"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 130
description: Working with big data and complex views
---
agileBase automatically takes some measures behind the scenes to maintain high performance as data volumes grow.

There are other mechanisms that can be manually enabled such as [caching]({{<relref "/docs/views/options#cache-view-rows">}}) and increasing the memory assigned to particular views.

Finally, we will be happy to to do all we can to speed up any parts of your application that require it if you [contact us](https://agilechilli.com/contact-us/). Often, a solution as simple as manually adding an index to a particular field can speed up requests by multiple orders of magnitude.

For really big data projects, there's also the option of utilising PostgreSQL-compatible database services designed for such tasks, like [Citus Data](https://www.citusdata.com/), which we will be happy to provision.