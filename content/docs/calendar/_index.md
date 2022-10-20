---
title: "Calendar"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Using the built in calendar and integrating with third party calendars
tags:
- Junior Software Architect
- v6
---
Any view with one or more date/time fields can have its data displayed in calendar form. If there are two date/time fields, the first will be the start time, the second the end time. If there's only one, events will last 1 hour by default, unless the field is a date only, in which case they will be all day.

Data can also [sync to and from external calendars]({{<relref "/docs/integrations/calendar">}}).

Any user can add the calendar tile to their homepage, then select views containing dates to display in it. Data can be displayed in a number of formats, like standard month/week/day views but also timeline views for a gantt-style format, with each view in its own swim-lane.

## Default views
Any views which are in a tile with the word 'calendar' in the name will show by default when a user first opens the calendar tile.

## Splitting a view into tracks
In a timeline grid display, each view will become a swim-lane or track down the left hand side of the screen. However it's also possible to create multiple tracks from a single view, choosing a field to split on. Each distinct value of that field will become a separate track.

For example, here's a view of recipe development milestones split on the product name:

![calendar timeline](/calendar-timeline.png)

To set this up, add a text calculation to the view called 'calendar splitter'. The calculation should output the value to split on, in this case the product name.

## Colouring events
By default, each view used in the calendar will be assigned a different colour.

Alternatively, you can choose to colour individual events, for example based on whether they're overdue or not.

To do this, add a text field to the view which has the [colour words]({{<relref "/docs/fields/field-options/text-field-options#colour-words">}}) option set, or a calculation with the [colour words]({{<relref "/docs/views/calculations#colouring">}}) option.