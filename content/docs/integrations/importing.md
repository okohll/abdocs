---
title: "Importing from spreadsheet"
date: 2020-06-03T16:40:00+01:00
type: docs
weight: 180
description: Adding to or updating existing data in a table using a spreadsheet import
tags:
- Citizen Developer
---
Agilebase allows data to be imported from CSV (Comma Separated Variable) files. All popular spreadsheet software can save data in this format.

Anyone with [**manage** privileges]({{<relref "/docs/security-and-compliance/security-features/privileges">}}) on a table can import data into it.

In the tiles interface, load any view created from the table to import into. Scroll to the bottom of the rows and press the cloud import icon, then follow through the prompts.

![import link](/import-link.png)

Data can be imported in two ways.

* insert all new records
* update existing records

Inserting new records will create a new record in the database for every line in the CSV file. Updating existing records will attempt to match each line in the file with an existing record and update all field values from the CSV. This can be useful when merging in data from an external source, or exporting, altering with a third party system and re-importing. Another use can be updating one field based on another - you can [export]({{<relref "/docs/security-and-compliance/security-features/exporting">}}), update the fields as necessary and re-import.

In either case, the CSV file must contain fields in the same order as they are in the table being imported into. The column titles don’t need to be the same though, it’s the order which is important. The import screen will show you the column order which is necessary.

## Updating existing records
When updating records, a key field must be selected to match records up. This can be any field that has the [unique]({{<relref "/docs/fields/field-options/common-options#unique">}}) property set. Alternatively the internal Agilebase rowID can be used. This field is included as the first field in any data export.

Sometimes, admins will want to do an export -> modify spreadsheet -> re-import workflow. This is straightforward:

1. Export from the admin interface by clicking the table containing the data you want to modify and clicking the _export_ button in the top toolbar.
2. Open the spreadsheet, making any modifications you need. The first column will be the internal ID for each record, keep this, it will be needed when re-importing.  
> Note it will be hidden - you can un-hide it in the spreadsheet for clarity
3. Blank out (remove content from) any columns which you haven’t updated. Otherwise if people have updated them since your export, you will overwrite their changes.
4. Re-import using an ‘update’ type import as above. Select _use internal Agilebase row IDs to identify records_

## Notes on special fields
For a file field, please leave an empty column in the spreadsheet in that position. If you wish to do a bulk upload of many images or documents, please contact [support](https://agilechilli.com/contact-us/).

Columns for [separator]({{<relref "/docs/fields/field-types/special-field-types/separators">}}) and [referenced data]({{<relref "/docs/fields/field-types/special-field-types/referenced-data">}}) fields should not be included in the import spreadsheet as these field types don't store data.

Data can be imported into [comment fields]({{<relref "/docs/fields/field-types/special-field-types/comment-feeds">}}) as per any other field.



