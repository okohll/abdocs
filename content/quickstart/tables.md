---
title: "Adding tables"
date: 2020-04-18T16:57:55+01:00
type: docs
weight: 10
---
Now we will create three tables to store our data, called
* organisations
* sites
* contacts

This demonstrates that you can use tables to link related data (we'll get to the links in a bit).

Organisations will contain company names and basic details

Sites will contain a list of addresses, because we may want allow an organisation to have more than one address

Contacts will contain a list of people, each linked to an organisation and optionally a site.

Separating the data into three tables lets us create these 'one-to-many' relationships, where one organisation can have many sites and contacts.

Don't worry about the relationships between tables at this stage, the first thing to do is just to create those three tables and leave them empty for now.

Use the [tables]({{<relref "/docs/tables/adding-and-removing">}}) page for instructions on creating a table.
