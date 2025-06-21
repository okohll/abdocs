---
title: "Testing"
date: 2022-07-07T12:15:00+01:00
type: docs
weight: 105
description: Using a test server to dry-run integrations
tags:
- Software Architect
- v6
---
When systems get to a certain size, in particular when you start integrating with apps representing other parts of the business, then it can be beneficial to be able to test new developments and changes before putting them live.

For example, when accepting orders via an e-commerce website, or sending invoices to an accounting package, or accepting incoming stock change records from Goods In staff using a bar code scanning application.

In cases like that, you don't want potentially large quantities of test data polluting your live system. And when systems are up and running, they can be mission critical - you don't want a change to cause online orders to be missed or incorrect invoices to transfer to accounts.

People from the traditional IT world will be familiar with the concept of testing changes during the development process, before deploying them live.

As Agilebase is a no-code platform, the processes are slightly different - there are no 'code' changes to deploy. But here's how we achieve the same.

## Commissioning a test server

In summary, when your system is
* mature
* mission critical
* integrating with third party systems

then you will most likely benefit from requesting a test server setup.

The test server will be an exact copy of your live system. The application structure (table, views etc.) will be the same as will the data itself in the database. All users and roles will also be the same, so people can log in using their existing username and passwords to test changes.

### The test process
1) Transfer a snapshot from your live system.
    * We use a Github Action to do this - please contact us for a URL to use. Just log in to that address and run the workflow to do copy the database
2) Make and test any changes on the test server
3) View a summary list of changes you've made
    * Use the [enhanced audit trail]({{<relref "/docs/security-and-compliance/security-features/usage-monitoring/usage-reporting#enhanced-audit-trail">}}) to see changes like field addition/removals or view alterations
    * If you don't already have the enhanced audit trail, it will be set up as part of the test server commisioning process
4) Re-create those changes in the live system
    * This is currently a manual process, though the audit trail above helps ensure you've not missed anything
    * Internal IDs for tables, fields and views are deterministic. That means if you create them with the same names in the same order on the live system, they will get the same internal IDs. Therefore APIs using them won't need changing
    * API Authorization keys however will be different, so will need updating in any system that calls a new API
    
## Testing Agilebase platform updates

As well as testing your own changes, the test server comes with the added benefit that you can access pre-release versions of new versions of the Agilebase platform itself.

That means you can test out new features before they're released and if you like run your own API tests against it.

We do of course have our own automated API and end to end tests, but you're welcome to add your own specific unit tests for any APIs specific to your setup.

You will be optionally enrolled onto our pre-release mailing list to be notified when a new version has been prepared, along with it's planned release date which will typically be Monday to Wednesday the following week.
