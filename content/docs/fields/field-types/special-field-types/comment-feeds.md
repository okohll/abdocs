---
title: "Comment Feeds"
date: 2020-05-07T16:40:00+01:00
type: docs
weight: 90
description: Comment feeds allow collaboration between users of a system
tags:
- Citizen Developer level 2
- v6
---
Adding a comment feed to a table adds a discussion area to a form, transforming its usefulness.

Comment feeds in Agilebase are quite a large topic, as one of the most often used features central to the platform. It's common for at least one comment feed to be added to every table in the system, allowing users to collaborate and discuss data wherever they are.

The ability to discuss and comment on data can be one of the most important mechanisms used to break down silo thinking and help organisations that wish to adopt a more systematic or process orientated view of things.

## Comment feeds in action
Here's an example of a comment feed in a table, being used to add a new comment. Previous comments can be seen underneath, with the user and date/time of each.

![add comment](/add-comment.png)

The available recipients are those people who have privileges to view data in the table (it's no use sending a comment to someone who can't see the data being discussed).

The user interface intelligently selects an initial list of recipients from those available, but they can be added or removed by the user.

> To add a user, type '@' then start typing their name. A dropdown list will appear from which you can pick the person.

In this example, Cliff, Gemma and Mark have been set to receive email notifications as well. The email they receive will contain a link to take them directly to the record the comment was added to. They can reply to the email to log an additional comment.

People who aren't recipients of a comment will still see the comment when they visit the record it's been added to, they just won't get a notification in their comments stream or elsewhere.

People who are mentioned by name in a comment (Mark in this example) will get an in-app alert as well as the comment appearing in their comment stream.

A user's notification options affect whether they receive comments from a particular table or person by default, and how they receive those comments. The table option [email notifications]({{<relref "/docs/tables/options#accept-emails-to-this-address">}}) also affects this.

### Comments to other fields
Although adding a comments feed field is the easiest way of allowing people to comment on data, users can at any time add a comment to **any** field on the screen, by hovering over the field until an 'add comment' icon appears. This opens a smaller, basic comment adding interface, without the options for choosing recipients above, rather the default set of recipients is always used.

## The comments stream tile
When someone's the receipient of a comment, they'll be able to see it in the comments stream tile on their homepage. Clicking on it will navigate to the related record. We won't go into every detail of the user interface in this administrator documentation, but comments can be searched and the comments tile can be expanded to full screen like any other tile.

## Email integration
As above, anyone who receives a comment notification can reply to the email to add another comment (their email address must be their username or recorded in their user defailt), or they can click on a link to view the related record including previous comments.

However, comments are also the mechanism by which emails from external parties can be logged - see the [accept emails to this address]({{<relref "/docs/tables/options#accept-emails-to-this-address">}}) table option.

When a [workflow]({{<relref "/docs/workflows/send-email">}}) or [chaser]({{<relref "/docs/workflows/send-chaser">}}) sends an outgoing email, that is logged as a comment (including any attachments) too.

## Slack integration
If [Slack](https://www.slack.com) is integrated via [company options]({{<relref "/docs/advanced-usage/company-settings">}}), every comment added will also be sent to your Slack workspace.