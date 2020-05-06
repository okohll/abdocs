---
title: "Sensitive data"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 70
description: Options relevant to storing commerically sensitive or personal data
---
In a table's _manage_ tab, there are two options which are worth considering if the data is storing commercially sensitive information (plenty of information in most customer systems falls under this category!) or personal information as defined by EU General Data Protection Regulations (GDPR).

When either option is ticked, two controls appear.

## Notify administrators on export
Here you can enter a number. When a user exports more than that number of records at once to spreadsheet, all administrators (users with the [administrator]({{<relref "/docs/security-and-compliance/security-features/privileges#assigning-the-administrator-privilege">}}) privilege) are notified by email.

## Disallow exports
This is also a number, representing a hard limit on the number of records which can be exported from this table at any one time.

> See also [exporting]({{<relref "/docs/security-and-compliance/security-features/exporting">}}) for how to set up export privileges. Exports are disallowed by default.

When **This table contains personal data, sensitive data or data about children** is ticked, a number of additional data entry boxes appear, to let you record the GDPR-relevant considerations.

> Note: This is for informational purposes only and doesn't by itself ensure compliance with the GDPR!. We recommend looking at the [ICO website](https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr/).

## Potential exfiltration information
When either option is ticked, some additional information is shown that can highlight opportunities for data to be exported.
* Any API views which send data to third party systems
* Any roles which are set up to allow exporting and which have users with privileges to see the table data