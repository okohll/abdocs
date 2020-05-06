---
title: "Upwards Navigation"
date: 2020-05-04T16:40:00+01:00
type: docs
weight: 80
description: Relations allow navigation from a child record to its parent
---
Whenever a relation field is used in a table, the user has the option to navigate to the related record by clicking a link next to the relation.

However its useful to know that if the relation is one of the first fields in the table, then it will be treated as having greater importance by the user interface. In this case, the relation will appear as a relation heading, making it clear the 'parent-child' relationship i.e. that one record 'belongs' to another.

For example, in a contacts table, if the relation to a contact's organisation is one of the first fields in the form, the organisation name will appear as a heading for the contact record. It will be a hyperlink so can be used to navigate to the parent organisation easily.

> A record can have multiple 'parents' of different types, e.g. a contact may belong to both an organisation and a site or department within that organisation.