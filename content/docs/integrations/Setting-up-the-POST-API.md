---
title: "Creating a POST API"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 120
description: A powerful automation feature that can allow a third party system to POST data in to Agilebase.
tags:
- Junior Software Architect
- v6
---

Firstly, identify the table into which you wish to receive incoming data. Edit that table and open the _API_ panel. Tick 'Public form or API data entry’, which will create an API for the table.

To protect the system from spam input, we also suggest you tick 'Require API key’ and reload the table to show the API key generated. This then has to be submitted with every POST request as the value of the HTTP Authorization header.

![Configuring the POST API](/incoming-data-api-new.png)

## OpenAPI (Swagger) description

You can see an OpenAPI description of the API in the _Use API_ panel when editing the table. The 'View / download OpenAPI definition of this API' link will let you access it.

Alternatively, if you don't have a login for Agilebase, you can call use a public URL

https://cloud.agilebase.co.uk/agileBase/Public.ab?describe_table=true&c=[mycompanyidentifier]&t=[mytableidentifier]

whilst also providing the required Authorization header.

## Posting data

Firstly, identify the Agilebase account by including a 'c' parameter in the URL, i.e.

https://cloud.agilebase.co.uk/agileBase/Public.ab?save_records=true&c=[mycompanyidentifier]

The _API_ panel will provide that URL for you.

As the body of the post, provide a JSON object containing an array of records to save or update, "data".

Each object in the array must have parameters

* **t**: the ID of the table to save into
* **action**: either 'save_new_record' or 'update_record'
* **rowid**: only required if the action is update_record, to identify the record to update

Then the actual data to save should be the other parameters in the object. Either internal field IDs or 'user facing' field names can be supplied. Field IDs are preferable if possible as they can't change.

An example JSON object is as follows:

```JSON
{ "data": [
    {
      "t": "testtable_ou4b",
      "action": "save_new_record",
      "textfield_juzo7j": "Gamma",
      "dateandtimefield_kt5kto": "25/12/2050 16:00", 
      "decimalnumber_jvfyz3": 25,
      "tickbox_jugw7x": true
    },
    {
      "t": "testtable_ou4b",
      "action": "update_record",
      "rowid": 10,
      "textfield_juzo7j": "Beta"
  }
]}
```

The above saves one new record and updates one existing record, both in the same table.

Remember also to set the 'Authorization' HTTP header if that option has been selected.

> A current limitation is that all records to save provided by the JSON array must be in the same table, the one the Authorization header value is for.
> However that may change in future, if we add the facility to use a single Authorization value for multiple tables.

### Response

If successful, the response will be a JSON array, with one object for each passed in as data to save.

Each object will contain the row ID of the updated, or newly created record. The row ID can be used to retrieve the full record e.g. using the [pull API]({{<relref "Setting-up-the-PULL-API">}})

For the above request, the response could be

```JSON
{ "results": [
    {
      "table": "testtable_ou4b",
      "action": "SAVE_NEW_RECORD",
      "rowId": 198657
    },
    {
    "table": "testtable_ou4b",
    "action": "UPDATE_RECORD",
    "rowId": 10
    }
]}
```

## Alternative mechanism: individual actions

As an alternative to providing a JSON object containing the data to save, you can instead save a single record by making a form POST, where the data for each field is identified by a parameter, the name of which is the internal ID of that field (read on for details).

This mechanism can be used if you need to upload files as part of the data - you can submit the form as multipart form data.

### Saving a single new record

Three parameters need to be included in addition to the data to save. They are

* _save_new_record = true_
* _c = [internalcompanyid]_
* _t = [internaltableid]_

The post URL is

https://cloud.agilebase.co.uk/agileBase/Public.ab

The form needs to be posted using the method POST.

Remember also to set the 'Authorization' HTTP header if that option has been selected.

#### Specifying the data to save
To specify the contents of each field to be saved, just add an 
* _[internalfieldname] = value_

parameter for each field.

The internal field names necessary will be shown on screen when API use is enabled.

Alternatively, friendly field name parameters can be used, with the addition of the parameter
* _allow_friendly_fieldnames = true_

Then _[internalfieldname]_ can be replaced by _[friendlyfieldname]_ which is the lowercase version of the field name, with spaces replaced by underscores and all other special (i.e. not a letter or a number) characters removed.

For example, the field 'Discount Approved?' would have the friendly name _discount_approved_.

We suggest you only use friendly fieldnames if you're confident the field name isn't going to change. Internal fieldnames are constant and never change, whereas friendly names can easily change if the field is renamed.

With the option on, internal field names and friendly field names can be mixed and matched, i.e either can be used for each field - some fields can be specified by internal ID and others by friendly name.

> The API can be tested using a tool such as [Postman](https://www.postman.com).

### Updating existing records individually
The process is similar, but instead of _save_new_record=true_, supply 
* _update_record=true_
* _row_id=[internal id of the record]_

The internal record ID can be got from a JSON feed or by using the _return=posted_json_ as above if editing a record previously created using the API.

### Uploading files
As well as 'standard' data, Agilebase can accept documents posted into a [file field]({{<relref "/docs/fields/field-types/special-field-types/file">}}). This can be done in two ways:

1) Make sure the form is posted with encoding type [multipart/form-data](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST). Then simply post the contents of the file with the form parameter specifying the internal name of the file field.
2) Post the form normally (not as multipart/form-data), and provide a URL value for the file field. That URL will be downloaded by Agilebase and the contents saved as a file.
> Method 2 is [Zapier](https://www.zapier.com)-compatible.

### Response

The response to the successful request will be a JSON representation of the complete record created or updated, after the update has taken place. An object of key-value pairs is returned, the key being the internal field name.

The row ID is returned with the key `rowId` - this is often useful to identify a record when performing multiple actions. For example, when a new record is created, the calling system may want to store its row ID in order to be able to make future updates to the same record.

If there is an error, an appropriate response code and explanation is returned, please see [response codes]({{<relfef "response-codes">}}).

