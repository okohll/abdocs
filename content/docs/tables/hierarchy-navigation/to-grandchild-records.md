---
title: "To grandchild records"
date: 2020-05-04T16:40:00+01:00
type: docs
weight: 70
description: Agilebase automatically exposes three-tier navigation structures
tags:
- Architect
---
[Tabs]({{<relref "tabs">}}) allow navigation from a parent record to a child, e.g. an organisation to a contact, order to order line, recipe to ingredient etc.

Of course, that child record may itself have subsidiary records of its own, e.g. a contact may have a tab for their training records.

When that's the case, Agilebase exposes both tiers of data on screen so the user can jump from the top level, in this example the organisation, directly to a contact's training records.

This type of navigation manifests in different ways according to the setup.

If a child links to the parent with a [one-to-one relation]({{<relref "/docs/fields/field-options/relation-field-options#one-to-one-only">}}) then links to 'grandchildren' are displayed by a menu in a tab. Here's a menu showing the various grandchild items under a product's specification.

![tab menu](/tab-menu.png)

If it's a many-to-one, then grandchildren are represented by blocks at the end of the record. 

![grandchild blocks](/grandchild-blocks.png)

Finally, in the special case when a grandchild tab's tab view contains the ID of both its immediate parent and the parent above that, then the grandchild contents are shown directly, underneath the child record. Here's an example where there's a three tier structure of

* supplier approval -> risk assessment -> risk assessment scores.

When the user looks at a supplier approval record, the risk assessment summary and scores can both be seen at the same time.
