---
title: "Company Settings"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 120
description: These settings apply to the whole agileBase account
tags:
- Pricipal Architect
---
To access them:
1. In the administration interface, expand the _Administration_ section at the bottom left
2. Select _company_
3. Click the pencil icon in the top toolbar to edit

### SMTP server
agileBase [workflows]({{<relref "/docs/workflows/send-email">}}) and [chasers]({{<relref "/docs/workflows/send-chaser">}}) that send emails use an @notifications.agilebase.co.uk email address by default.

You may wish to instead use email addresses from your own domain name, especially if the system sends emails to people outside your organisation, like customers or suppliers.

To allow this, you will need to use your own SMTP server, or a third party trusted system authenticated against your domain name. Using a service like [AuthSmtp](http://www.authsmtp.com/), [SendGrid](http://www.sendgrid.com/) or [Amazon Simple Email Service](https://aws.amazon.com/ses/) is probably the most straightforward way of setting this up - their instructions will tell you how to set up facilities such as Sender Policy Framework and DomainKeys in order to increase email deliverability.

Once you have the SMTP server address, username and password from your service, enter them into the details in this section in agileBase.

### Slack Webhook URL
See [Integrations - Slack]({{<relref "/docs/integrations/slack-integration">}})

### Send chart subscriptions from
Users can opt to have daily, weekly or monthly emails sent to them containing all the charts they've subscribed to for that period. The emails will come from an email address @notifications.agilebase.co.uk by default, this option will allow you to specify your own address.

If used, then the SMTP details above also need to be completed.
