---
title: "Send Data to a third party via API"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 130
description: Each workflow can perform a single specific action
tags:
- Software Architect
---

When integrating Agilebase with third party systems, the API is really useful. Programmers can use it to send data to websites, to other software such as PowerBI, a  Business Intelligence tool, or to external systems such as label/barcode printers for example. The opportunities are endless.

Agilebase can either ‘push’ data to a third party system, or have the third party system ‘pull’ it out.

What’s the difference? Simply put, if pulling, a third party system has to regularly ask, or 'poll', Agilebase whether there’s any new data. It may do this once an hour, once every few minutes or however often it needs. That means extra work for both systems. New data may be reasonably infrequent but when it is there you want it to be transferred quickly, which means polling often even when there’s nothing to send.

Conversely, with ‘push’, Agilebase sends a message to the third party system **only when there’s relevant data to send**.

## PUSH
When using push, calls are made only when necessary. Further, you can specify in the settings the maximum number of calls to make per day, so you can control the maximum possible cost. You can set it to anything from once every 5 minutes to once a day. Different integrations may require more or less timely data. For example invoice totals may be ok to push to an accounting system once a day but individual customer orders may be best sent as soon as they’re received.

[More detail about setting up a PUSH API can be found here]({{<relref "/docs/integrations/setting-up-the-push-api">}})

## Pull

Connections to Agilebase are made using standard HTTP calls. This makes it easy for developers in any language, so PHP, Java, even JavaScript in a browser can be used.

[More detail about setting up a PULL API can be found here]({{<relref "/docs/integrations/setting-up-the-pull-api">}})
