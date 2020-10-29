---
title: "Adding some fields"
date: 2020-04-18T16:57:55+01:00
type: docs
weight: 20
---
Now we have out three tables - organisations, sites and contacts, lets add some relevant fields to each.

For example, in the organisations table, a text field 'organisation name' would be an obvious starter. You could also add things like 'website' and perhaps a number field to record annual turnover, should you be interested in that.

Sites should include a few address fields and contacts can include a full name (or separate forename and surname fields) along with various fields for email address and other contact details.

To add a field to a table, follow the [fields]({{<relref "/docs/fields">}}) page.

Once the basic fields are added, here's a key step: linking the tables together, so that the system knows that a contact belongs to an organisation & site and a site belongs to an organisation.

1. In the sites table, add a [relation]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}) field, linking to the organisations table. For the display field, choose the 'organisation name' or your equivalent.
2. In the contacts table, add a relation field linking to the organisations table in a similar way
3. Also in the contacts table, ad a relation field linking to the sites table. Use postcode or zip code as the display field.

Finally and optionally, we can add some tabs to the organisation table, so that the user can add view and edit sites and contacts when looking at an organisation:

1. In the organisations table, [add a tab]({{<relref "/docs/tables/hierarchy-navigation/tabs">}}). When selecting a table to use for the tab, choose sites
2. Again in the organisations table, add another tab for contacts
