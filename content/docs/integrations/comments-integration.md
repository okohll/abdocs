---
title: "Comments integration"
date: 2020-06-02T16:40:00+01:00
type: docs
weight: 170
description: Allows comments posted in Agilebase to be shared as Slack/Teams/Google etc. notifications
tags:
- Software Architect
- v6
---
When a comment is added to a record in Agilebase, a copy can be sent to your Slack or Teams workspace, to a specific channel appropriate to the tile.

In fact, the comment can be sent to any external service that accepts push notifications to a URL. We recommend setting up a webhook URL via an easy to use integration tool like Zapier or Microsoft Power Automate. That tool can then be set up to post the message to any supported service of your choice.

Every time a comment is added, the full text and additional details will be posted in JSON format to the URL specified.

Enter the comments webhook URL in the [company settings](/docs/advanced-usage/company-settings#comments-webhook-url)
