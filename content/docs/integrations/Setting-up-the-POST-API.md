---
title: "Creating a POST API"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 120
description: A powerful automation feature that can allow a third party system to POST data in to agileBase.
tags:
- Architect
---

Firstly, identify the table into which you wish to recieve incoming data. Go to that table's manage taband press 'options’. Tick 'Public form or API data entry’, which will create an API for the table.

To protect the system from spam input, we also suggest you tick 'Require API key’ and reload the table to show the API key generated. This then has to be submitted with every POST request as the value of the HTTP Authorization header.

Optionally, you can add an email address to notify when a new item is added and an autoresponse text which will be sent to any email addresses found in the posted data.

![Configuring the POST API](/incoming-data-api-new.png)

## Creating new records

Clicking the ‘sample form’ link will then show a sample form which can be used for testing or to copy code from. 

If you want to submit data directly from an app rather than a web form, simply prepare a HTTP POST request that mimics the form. Again, use the source code of the form as a reference. Note the form contains three hidden fields that need to be included. They are listed at the start of the sample form, for reference they are:

* _save_new_record = true_
* _c = [internalcompanyid]_
* _t = [internaltableid]_

The post URL is

https://appserver.gtportalbase.com/agileBase/Public.ab

The form needs to be posted using the method POST.

Remember also to set the 'Authorization' HTTP header if that option has been selected.

### Specifying the data to save
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

## Updating existing records
The process is similar, but instead of _save_new_record=true_, supply 
* _update_record=true_
* _row_id=[internal id of the record]_

The internal record ID can be got from a JSON feed or by using the _return=posted_json_ as above if editing a record previously created using the API.

## Uploading files
As well as 'standard' data, agileBase can accept documents posted into a [file field]({{<relref "/docs/fields/field-types/special-field-types/file">}}). This can be done in two ways:

1) Make sure the form is posted with encoding type [multipart/form-data](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST). Then simply post the contents of the file with the form parameter specifying the internal name of the file field.
2) Post the form normally (not as multipart/form-data), and provide a URL value for the file field. That URL will be downloaded by agileBase and the contents saved as a file.
> Method 2 is [Zapier](https://www.zapier.com)-compatible.

## Response

The response to the successful request will be a JSON representation of the complete record created or updated, after the update has taken place. An object of key-value pairs is returned, the key being the internal field name.

The row ID is returned with the key `rowId` - this is often useful to identify a record when performing multiple actions. For example, when a new record is created, the calling system may want to store its row ID in order to be able to make future updates to the same record.

If there is an error, an appropriate HTTP response code is returned (see below) along with JSON explaining the error, containing three keys. For example if an incorrect Authorization header is supplied, the response may be

```
{
  "error": true,
  "type": "DisallowedException",
  "message": "User public api is not allowed to edit delete data in table my table. An administrator can set up privileges so this can be allowed"
}
```

### HTTP response codes
* 200: success
* 401: unauthorised: the API key is missing or invalid
* 404: not found: an object identified in the request was not found e.g. no match was found for a table ID specified with the 't' parameter
* 429: too many requests: the frequency of requests is too high, please throttle them back
* 507: insufficient storage: when creating a record, the limit on number of records which can be stored has been reached. Contact us to purchase additional capacity.
* 500: some other server error

When there is an error, a response header X-AB-error is also set with the type and content of the error message.
