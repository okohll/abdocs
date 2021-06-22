---
title: "Exporting"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 40
description: Allowing users to export data to spreadsheet
tags:
- Architect
---
Exporting to spreadsheet is only one way of getting data out of agileBase, but it is the most commonly used amongst everyday users. For less ad-hoc data transfers, such as integrations with third party systems involving incoming and/or outgoing data, the [API]({{<relref "/docs/integrations">}}) can be used.

## Allowing exports
In order for a user to be allowed to export to spreadsheet, a number of critieria have to be matched, to suitably protect your organisation's data.
1. The user must have [Two Factor Authentication]({{<relref "users#two-factor-authentication">}}) enabled
2. The view to export from must have exporting enabled (it's enabled by default). To do this
    - in the tiles interface, open the view in question, click your user icon at the top right and select _admin - edit view_
    - tick _allow exports_
3. The user must also be a member of a [role]({{<relref "roles">}}) that allows exporting (disabled by default). To allow exporting for a role,
    - in the admin interface, expand the _Administration_ menu in the lefthand sidebar
    - click _roles_ and select the role you want
    - tick _allow exports_

A user with [manage privileges]({{<relref "privileges">}}) on the view's parent table can bypass criteria 2 and 3. This privilege is not commonly applied to normal users.

## Exporting
A user with the ability to export can do so by opening the view, clicking the print icon to the left and selecting _export to spreadsheet_ from the options at the top of the screen.

> If the user [filters]({{<relref "/docs/views/filters">}}) the data on screen before doing this, only the filtered data will be exported.

The resulting spreadsheet will be in Microsoft Excel format. The first sheet will be some metadata about the export, such as a timestamp, the name of the exporter and any filters applied. The second sheet will be the actual data.

Column A in the data sheet will be hidden. It holds the internal row ID of each record. This is useful for matching purposes if you're going to be modifying then re-importing the data.

### Charts
If the view has [charts]({{<relref "/docs/charting">}}) attached, one sheet per chart will also be included in the spreadsheet. The contents will be the chart data, not the chart visualisation itself, but the visualisation can easily be re-created in the spreadsheet from the data if necessary.

## Limits and notifications
An administrator can log whether each table contains commercially sensitive data (ticked by default) and/or personal data (see https://gdpr-info.eu/art-4-gdpr/). If either of these options is ticked for a view's parent table, you’ll have additional options for
* notifying all administrators if an export of more than a certain number of rows is done
* setting a hard limit to completely disallow exports of more than a certain number of rows

To configure these options, see [tables]({{<relref "/docs/tables/options">}})
