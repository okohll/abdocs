---
title: "Options"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 80
description: Options which alter table behaviour
tags:
- Software Architect
- v6
---
To access these options, [edit a table]({{<relref "/docs/tables/adding-and-removing#editing-a-table">}}) and select 'tags and options'.

## Allow add
If this is ticked (it is by default), users can add records to the table. Anyone with develop privileges on the table can add tables regardless.

### Only from within tab
If this is ticked, users can add records but only when accessing this table's form from within a tab of a parent record. This can help ensure that child records are always connected to a parent and aren't created as 'orphans'.

## Allow clone and merge
(Off by default). Show a clone/merge record button when a user is viewing a record.

Cloning makes a simple copy of all data in the record. The contents of tabs are not cloned. A more advanced clone facility can be created with a [workflow]({{<relref "/docs/workflows">}}) if desired.

Merging allows the user to select another record to merge with this one. This is commonly use to resolve a situation where there are duplicate records. The contents of one are merged into the other, then the first deleted. A wizard will guide the user through selecting which data to keep from each record. Child records from the deleted record will be re-attached to the one remaining. So for example if Organisation 1 containing two contacts is merged with Organisation 2 containing 3, a single organisation with five contacts will result.

## Allow remove
(On by default). Allow records to be deleted by people with EDIT privileges as well as people with develop privileges, who can always delete.

## Allow share
Showa button which allows links to individual records to be shared between users using email. Note - recipients still need a login and relevant privileges to see the record.

## Data entry from external sources
The options in this section are for configuring the table to allow an API request from an external source to create and edit records. See [API use]({{<relref "/docs/integrations">}}) for more information.

## Other options
### Records lockable
Records can be locked to prevent editing. You may like to do this based on criteria e.g. once a customer order has been sent, it should be locked against further changes.

To actually lock the record, a [workflow]({{<relref "/docs/workflows">}}) can be used.

Locked records can be manually unlocked by someone with develop privileges on the table, but only one at a time.

### Email notifications
When someone adds a comment to a record, when selecting recipients, they have the option to email those recipients, as well as adding the comment to the [comment stream]({{<relref "/docs/tiles">}}). Ticking this table option sets the default to send emails for any comment added to this table. Users can override this on an individual comment basis and recipients can override in their notification preferences.

### Flag records with colour
Enter a field name here and add a field with the same name to a view, to flag records. The contents of the field must be one of the colour names as given on the screen. The field added to the view can be a calculation, specifically a hidden calculation. This will flag the view without showing the colour name on screen.

This option can also be used to colour items in a junction chooser (see tab option: [Choose a record when a new item is added]({{<relref "/docs/tables/hierarchy-navigation/tabs#choose-a-record-when-a-new-item-is-added">}})). In the junction table, set this option, then in the view used as a relation picker (set in the [relation field options]({{<relref "/docs/fields/field-options/relation-field-options#view-to-use">}})), add the colour calculation.

> It's also possible to colour individual table fields or calculations in a view (as opposed to this option which flags the whole row). See the options for [field colouring]({{<relref "/docs/fields/field-options/text-field-options#colour-words">}}) or [calculation colouring]({{<relref "/docs/views/calculations#colouring">}})

### Accept emails to this address
The system can accept incoming emails and attach them to relevant records e.g. attaching an email from a customer to that customer's record.

For details on how to set that up, see [email integration]({{<relref "/docs/integrations/email-integration">}}).

## Information
After the options, some structural information is shown, such as which tables depend on this one i.e. have a [relation]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}) to it, how many fields and views per tile there are. See also the [usage dashboard]({{<relref "/docs/security-and-compliance/security-features/usage-monitoring/usage-reporting#the-dashboard">}})


