---
title: "Tabs"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 120
description: Showing data in a form tab
---
Where there is 'child' data related to a parent table, e.g. a contact belonging to an organisation, a list of child records can be shown in a tab in the parent record. 

A view can specify which records are shown. Perhaps some should be filtered out, like e.g. contacts who no longer work at the organisation - [view filters]({{<relref "../filters">}}) can accomplish that.

The fields of the view are what's shown in data rows in the tab.

Additionally, a separate view can be set in the tab options, to allow for creating records to populate the tab with an initial set of data.

For more information on setting this all up, see [table tabs]({{<relref "/docs/tables/hierarchy-navigation/tabs">}}).