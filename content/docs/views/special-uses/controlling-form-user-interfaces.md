---
title: "Controlling Form User Interfaces"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 140
description: Using a view to control a form - hiding/showing different areas, locking data and expanding/contracting blocks of fields on screen
---
The record editing form on screen can be programatically controlled to hide or show various elements, like tabs and individual fields. Fields can also be locked for editing and tabs can be coloured.

This allows relevant information to be shown/highlighted on screen - what is shown at any one time can change depending on the state of the data in the system. As a brief example, when a sales opportunity is closed, additional fields could appear asking for the outcome details to be recorded.

In a similar way to most other view uses in this section, the ID of the record being edited is used to filter the view chosen for the form element. If that ID appears in the view, the element is shown/unlocked etc., if not it isn't.

Here are some references for how to accomplish each feature:
* [Controlling field visibility]({{<relref "/docs/fields/field-options/common-options#show-if-record-in-view">}})
* [Locking and unlocking fields]({{<relref "/docs/fields/field-options/common-options#unlock-if-record-in-view">}})
* [Initially expanding or contracting blocks of fields]({{<relref "/docs/fields/field-options/separator-options">}})
* [Hiding or showing tabs]({{<relref "/docs/tables/hierarchy-navigation/tabs#show-only-if-in-view">}})
* [Colouring tabs]({{<relref "/docs/tables/hierarchy-navigation/tabs#colour-from-view">}})
