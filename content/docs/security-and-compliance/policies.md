---
title: "Policies"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 20
description: Policies and further information
tags:
- System Owner
---
## Backups
Data backups are performed across the stack of technology, from server down to databases and file storage.

Database and agileBase content (uploaded files, custom templates etc.) backups are taken daily and hosted in the European Union by Amazon. Older backups transition to [Amazon Glacier](https://aws.amazon.com/glacier/) and are kept for 200 days - this allows a balance between the practical necessity of allowing rollbacks to a certain point in time, whilst not storing data for an unnecessarily long period, to comply with the GDPR.

These backups are encrypted so that Amazon has no access to the data within then.

The backup and recovery process is monitored and tested regularly.

### Retrieval
There may be a charge for retrieval of customer data from backup, to cover our costs. The data will be restored to a separate instance of agileBase available at a different URL, which a customer can look at to compare data. If necessary, data can then be extracted from one and loaded into the other.

> Please be aware that depending on needs, this may be a complex process due to the fact that other data in the live system may have changed since the backup. A simple overwrite of existing data may not be the best option.

## Privacy policy

agileBase Ltd is funded directly by the customers we provide services to, we do not have any other business model, particularly we do not resell any data.

Our privacy policy is available here: https://agilechilli.com/help-centre/agilebase/privacy-policy/

## GDPR Policy

An overview of our GDPR policy is available [here](/gdpr-overview.pdf).

[![GDPR Compliance Cycle](/gdpr-compliance-cycle.png)](/gdpr-overview.pdf)

## Data Protection and Disaster Recovery

Full details of our processes and plans are available to customers and relevant parties on request.
