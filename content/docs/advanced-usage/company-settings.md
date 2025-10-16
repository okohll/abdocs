---
title: "Company Settings"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 120
description: These settings apply to the whole Agilebase account
tags:
- Software Architect
- v6
---
To access them:
1. From the homepage, click your user icon at the top right of the screen and choose _Profile_ from the menu
2. Go to _Account_ -> _Organisation Settings_ from the lefthand navigation bar

### Mandate 2FA
When this is ticked, all users in the organisation will be required to set up [Two Factor Authentication]({{<relref "/docs/security-and-compliance/security-features/users/2fa-setup" >}}) before they can see or use any features of the application.

We recommend that all administrators enable this if possible. Even when 2FA is mandated, admins can still [disable it temporarily]({{<relref "/docs/security-and-compliance/security-features/users#two-factor-authentication" >}}) on a per-user basis. The next time they log in they will be prompted to set it up again.

When this is off, users will still be prompted to set up 2FA, it just won't be mandatory.

### SMTP server
Agilebase [workflows]({{<relref "/docs/workflows/send-email">}}) and [chasers]({{<relref "/docs/workflows/send-chaser">}}) that send emails use an @notifications.agilebase.co.uk email address by default.

You may wish to instead use email addresses from your own domain name, especially if the system sends emails to people outside your organisation, like customers or suppliers.

To allow this, you will need to use your own SMTP server, or a third party trusted system authenticated against your domain name. Using a service like [AuthSmtp](http://www.authsmtp.com/), [SendGrid](http://www.sendgrid.com/) or [Amazon Simple Email Service](https://aws.amazon.com/ses/) is probably the most straightforward way of setting this up - their instructions will tell you how to set up facilities such as Sender Policy Framework and DomainKeys in order to increase email deliverability.

Once you have the SMTP server address, username and password from your service, enter them into the details in this section.

### Default From: Address
This is the email address that email messages (workflows and chasers as above) come from, unless overridden in the individual notification or chaser view settings.

You should set it to be an address from your own domain name.

It's also the address that [chart subscription emails] get sent from.

If the SMTP server details above aren't filled in, this has no effect, emails will come from *anaddress*@.notifications.agilebase.co.uk

### Comments Webhook URL
See [Integrations - Comments]({{<relref "/docs/integrations/comments-integration">}})

### Export message
As you will know, your organisation is required to protect personal data, as per the GDPR. One thing to watch out for is what happens to data that is exported to spreadsheet?

There are various [rules]({{<relref "/docs/security-and-compliance/security-features/exporting">}}) you can set up to control exports that are well worth familiarising yourself with, as an administrator. These control who can export, what they can export and how much can be exported. Once data is in a spreadsheet of course, the system no longer has any control over it. It can be emailed, shared etc. as the spreadsheet owner wishes. 

This option allows you to set the text of a prompt that users see before exporting. It can be used to remind people of their obligations and point them to any further information provided by your organisation. They will need to tick to accept before performing the export.

