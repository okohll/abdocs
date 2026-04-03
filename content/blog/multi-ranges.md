---
title: "Example: finding scheduling conflicts"
date: 2026-04-02T09:57:55+01:00
type: docs
weight: 60
description: A neat calculation to find overlaps of any date-based data in Agilebase
---
There's a relatively new (given Postgresql's history) database feature called ‘date multi-ranges’ and it turns out that a partner of ours has found a great use for them for a customer they’re working with.

It’s so interesting that I thought I’d write it up here. It’s potentially a widely applicable example with many possible uses amongst other customers, but also it’s just an elegant example of a great database feature that people who like to see how things work might like.

Since Agilebase uses Postgresql under the hood, all Postgres functions are available to you, as an Agilebase architect.

![A mountain, showing the layers of sedimentary rock laid down over time](/sedimentary.jpg)
*A different type of date range*
*the geological Rhododendrites, CC BY-SA 4.0, via Wikimedia Commons*

A typical problem to solve with date multi-ranges, is one of scheduling. Say you have many staff, each of whom have lots of appointments they need to be at throughout a day. Those appointments can be booked by themselves or assigned from other people from different departments.

What we want to do is make sure there are no double bookings, i.e. no bookings that overlap with others.

It turns out we can solve this relatively easily with multi-ranges, using nothing more than a single calculation.

As a starting point, we create a single view containing all the appointments. We have one row per appointment, each with a start time and an end time, something like

| Staff	| Booking	| Start time	| End time |
|---|---|---|----------|
| Alice	| Octavia Butler	| 9am	| 10am     |
| Alice	| Stephen King	| 10:30	| 11:30am  | 
| Alice	| Zora Hurston	| 11am	| 12pm | 
(we’ll assume that there’s a date attached to each start and end time too, it’s just not written in here for brevity).

The first step is to combine the start and end times into one ‘thing’, a date range. Later on we’ll be able to compare date ranges with each other to find overlaps. In PostgreSQL, a function ‘tsrange’ can be used to do that, which gives us

| Staff	| Booking	| Range (tsrange) |
|---|---|---|
| Alice	| Octavia | Butler	| 9am – | 10am |
| Alice	| Stephen King	| 10:30 – | 11:30am |
| Alice	| Zora Hurston	| 11am – | 12pm |

The next step conceptually is that for each row, we want to create a collection of all date ranges for a particular staff member, excluding the current row. Finally we want to search that collection for any overlaps with the current row. If there is one, we’ve found a conflict.

That’s where multi-ranges come in. A multi-range is a collection of date ranges and you can create one with the Postgres function `range_agg`. It looks in general like this:

`range_agg(range)`

or in our example

```
range_agg(
tsrange(start time, end time)
)
```

If we simplify the view to just the staff name column and this new range_agg calculation, that will condense the three rows down into one ‘multirange’ object, the collection of all ranges:

| Staff	| Multirange (range_agg) |
|---|---|
| Alice	| 9am - 10am, 10:30am - 11:30am, 11am - 12pm) |

That’s a good starting point. What we now want to do is expand things out again to the three rows, but compare each one with that multirange.

Seasoned database people may know that this is a good job for a window function. Window functions arrived relatively late in the development of SQL databases, but are particularly useful for many things. If you’ve not come across them, it’s worth reading up on them, particularly if you’re an Agilebase architect developing larger applications.

For now it doesn’t matter either way, all we need to know is that they do what we want. The window function definition is just an extension of the range_agg function above:

```
range_agg( tsrange(start time, end time) )
over (
partition by staff
rows between unbounded preceding and unbounded following
exclude current row
)
```

I admit that last bit is quite a mouthful, the syntax is perhaps a bit much. All the ‘rows between…’ line means is: process every row for a staff member.

‘exclude current row‘ is the important bit, which does what it says on the tin (we don’t want to detect a date range conflicting with itself). So if we add back in all columns and end with the calculation above, we get

| Staff	 | Booking	        | Range (tsrange)                        | Multirange window function |
|--------|-----------------|----------------------------------------|----------------------------|
| Alice	 | Octavia Butler	 | 9am - 10am | 10:30 - 11:30, 11am - 12pm |
| Alice	 | Stephen King	   | 10:30 - 11:30am | 9am - 10am, 11am - 12pm |
| Alice	 | Zora Hurston	   | 11am - 12pm | 9am - 10am, 10:30 - 11:30am |

As you can see the last column, our window function calculation, returns a list of all the ranges for Alice that are not the current row.

The last bit of magic is to compare the range for each row in column 3 with the window function results for that row (column 4) to see if the range overlaps the multirange. If it does, we have a conflict. That’s indeed the case for two rows which conflict with each other, Stephen King and Zora Hurston. Stephen’s 10:30 - 11:30 range overlaps with the 11am - 12pm part of the multirange, and Zora’s 11 - 12 overlaps with the 10:30 - 11:30.

To do that calculation in the database is very straightforward, we can use a single operator `&&` which checks whether a range overlaps with a multirange.

This is one of the many cases where Postgresql does all the work for you. We just create a calculation

`range && multirange`

If we want to keep everything in a single calculation, we can expand that out, inserting the range and multirange calcs we already have:

```
range_agg( tsrange(start time, end time) )
&&
range_agg( tsrange(start time, end time)
over (
partition by staff
rows between unbounded preceding and unbounded following
exclude current row
)
```

The first three lines are the range, the rest are the multirange. The whole thing just returns a true or false for each row, true if there’s an overlap and false if there isn’t.

Filtering the results to just those where there is an overlap will give us

| Staff	| Booking	| Range (tsrange) | Multirange window function | Overlap |
|---|---|---|---|---|
| Alice	| Stephen King	| 10:30 - 11:30am	|  9am - 10am, 11am - 12pm | true |
| Alice	| Zora Hurston	| 11am - 12pm |  9am - 10am, 10:30 - 11:30am | true | 

That’s the basic idea - a couple of knotty concepts to get your head round but a very elegant solution once you know how things work.

In the real world of course, we might like to do extra things, like add columns to show more details about the overlaps, or maybe show just the times which overlap. If anyone wants to use or think about this for their own systems, please let me know, I’d be delighted to see it in use and help if I can.

- Oliver