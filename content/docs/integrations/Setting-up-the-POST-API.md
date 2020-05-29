---
title: "Setting up the PUSH API"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 100
description: A powerful automation feature that can allow a third party system to POST data in to agileBase.
---

Firstly, identify the Table into which you wish to recieve incoming data.
Go to that table's manage taband press ‘options’. Tick ‘public data entry’.

To protect the system from spam input, we also suggest you tick ‘Require API key’ and reload the table to show the API key generated. This then has to be submitted with every POST request as the value of the HTTP Authorization header.

Optionally, you can add an email address to notify when a new item is added and an autoresponse text which will be sent to any email addresses found in the posted data.

![Configuring the POST API](/incoming_data_api.png)

## Creating new records

Clicking the ‘sample form’ link will then show a sample form which can be used for testing or to copy code from. 

If you want to submit data directly from an app rather than a web form, simply prepare a HTTP POST request that mimics the form. Again, use the source code of the form as a reference. Note the form contains three hidden fields that need to be included. They are listed at the start of the sample form, for reference they are:

save_new_record=true
c=[internalcompanyid]
t=[internaltableid]
The post URL is

https://appserver.gtportalbase.com/agileBase/Public.ab
The form needs to be posted using the method POST

Remember also to set the ‘Authorization’ HTTP header if that option has been selected.


>NB: To get the details of data posted into the database, please also supply the parameter _return=posted_json_ This will include the internal row ID of the newly inserted record.

API use can be tested using the Postman extension for Google Chrome. Note that forms have to be posted with encoding type ‘application/x-www-form-urlencoded’.

## Updating existing records
The process is similar, but instead of _save_new_record=true_ supply 
_update_record=true_
_row_id=[internal id of the record]_

The internal record ID can be got from a JSON feed or by using the _return=posted_json_ as above if editing a record previously created using the API.

### HTTP response codes
401: unauthorised: the API key is missing or invalid

429: too many requests: the daily limit of requests to this table has been reached. Contact us to purchase additional capacity

507: insufficient storage: the limit on number of records which can be stored has been reached. Contact us to purchase additional capacity

500: some other server error