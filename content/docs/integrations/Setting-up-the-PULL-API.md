---
title: "Creating a PULL API"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 140
description: Control how third party systems read data from Agilebase
tags:
- Junior Software Architect
- v6
---

Connections to Agilebase are made using standard HTTP calls. This makes it easy for developers in any language, so PHP, Java, even JavaScript in a browser can be used.

1) The first step is to create a view in Agilebase that contains the data you want to make available to other apps. You can use the standard view creation features of the administrator interface, including adding fields and calculations, sorts and filters.

2) Secondly, turn on the ability for the view to be accessed via a PULL API by going to the _use API_ panel, and ticking _Send data to a third party system using the API_.

3) Finally Tick the _Allow access from third party software using an API key_. 

The remainder of this article explains how to PULL the data.

![Configuring the PULL API](/workflow-pull-new.png)

The most important piece of information is the URL that the third party will access your data via. This will be:

https://cloud.agilebase.co.uk/Agilebase/Public.ab

If you host on your own cloud or on premises, this may be different.

Requests can contain a number of parameters, the one which must be supplied to use the JSON API is _get_report_json=true_. 
Other parameters to control various options are detailed below.

HTTP requests can be submitted as GET or POST.

Three parameters for the view also need to be submitted as parameters to the request. These are ‘c’, ‘t’ and ‘r’, the values are displayed in the administrator interface (see screenshot above). Together, these identify the view from which to extract data.

Finally, the API key provided needs to be submitted not as a HTTP request parameter, but as a header named ‘Authorization’. This is to reduce the change of it being cached or used in a browser string where it can be easily retained and read by unauthorised users.

### PHP
Here’s a complete example of making a request, using PHP in WordPress

```php
$url = 'http://cloud.agilebase.co.uk/Agilebase/Public.ab?get_report_json=true&simple_format=true&t=mytablecode&r=myreportcode&c=mycompanycode';

$args = array('headers' => array( 'Authorization' => 'myauthorisationkey'));

$response = wp_remote_get( $url, $args );

var_dump($response);
```

Sample output would look like
```json
[
  {
    "forename": "Oliver",
    "surname": "Kohll",
    "email_address": "oliver@agilebase.co.uk"
  },
  {
    "forename": "Simon",
    "surname": "Minton",
    "email_address": "simon@agilebase.co.uk"
  },
  {
    "forename": "Cliff",
    "surname": "Calcutt",
    "email_address": "cliff@agilebase.co.uk"
  }
]
```
of course the fields being those returned for the particular view chosen.

### A Python example
```python
import requests
# API endpoint
url = <request_url>
# Headers, including the authorization header
headers = {
    "Authorization": "Bearer API_KEY"
}
# Making the GET request
response = requests.get(url, headers=headers)
# Check if the request was successful
if response.status_code == 200:
    # Parsing the JSON response
    data = response.json()
    # Printing the JSON output
    print(data)
else:
    print(f"Failed to retrieve data: {response.status_code}")
```

### Command line
Or just a simple one-liner:

```bash
curl -H "Authorization: Bearer API_KEY" "http://cloud.agilebase.co.uk/Agilebase/Public.ab?get_report_json=true&t=mytablecode&r=myreportcode&c=mycompanycode"
```

### Request options

Here are the options that can be provided as parameters to the request, along with the c, t and r identifiers and in addition to get_report_json=true.

#### simple_format=true/false (default false)
This option controls the JSON format returned. With simple_format=true, the response will be a simple array of objects, each containing keys for the field names as above. Keys are basically lowercase field names with spaces replaced by underscores, so “Email address” would become “email_address”
With simple_format=false, a more complex but more robust format it used. Rather than field names, internal Agilebase field identifiers are used as keys. This has the advantage that if the field names are changed (easy for an Agilebase administrator to do), the JSON will remain the same. The first object in the JSON will be a dictionary mapping internal identifier to field name.

<!-- deprecated: jsonp not used any more for security reasons - CORS has replaced
#### json_format=json
With this option, just the JSON will be returned. This is the usual case required. Without it, complete Javascript will be returned defining the JSON as an object, i.e. `var abJson=[…]` which can be useful if you want to run the result as Javascript.
-->
<!-- Mistaken option
#### return=posted_json
Optional, if this is included, the return content will be JSON including the ID of the record as well as the full content of the data.
-->
#### unencode_html=true
Causes characters which would normally be encoded as HTML entities (e.g. `&` -> `&amp;`) to be returned unencoded

#### exact_filters=true/false (default false)
If true, filters (see below) will be need to match results exactly instead of using the default 'contains' filtering

#### row_limit=[row limit]
The default limit on the number of records to return is 10,000. Add this parameter to change it. Note the hard maximum allowed is 100,000.

### Filtering

To filter on a particular field, add a HTTP parameter for it, with the value the filter you want.

For parameter names, just use the internal Agilebase field identifiers. These can be seen in the API panel when editing a view, or the field properties when editing an individual field.

Alternatively you can use the 'simple' version of the field name, which is the name in lowercase with all 'special' characters removed and spaces replaced by underscores. This might be easier to look at, however has the disadvantage that user-facing names may change over time whereas internal field IDs will remain constant.

By specifying exact_filters=true, an exact match rather than a 'contains' match will be used for text field filters supplied. Using this, your filter can also contain symbols such as '>' or words like ' OR ' which would otherwise change the behaviour of the filter as below.

Standard Agilebase quick filters can be used for preparing complex criteria on multiple fields, for example in each field using “?” to find blank records, > and < for numbers and date ranges, phrases like “last month” for dates, “=[word]” for exact matches, “:word” for starts with, and “!word” for doesn’t contain.

### Response codes

* 200: request successful
* 401: unauthorised: the API key is missing or incorrect
* 404: not found: an object identifier (company ID, table ID or report ID) was supplied that wasn’t found in the system
* 429: too many requests: the frequency of requests is too high, please throttle them back
* 500: some other server error

When there is an error, the X-AB-error header will be set and JSON returned representing the error, as happens with the [POST API]({{<relref "Setting-up-the-POST-API#response">}}).

> To ensure one customer's use doesn't consume an inordinate amount of resources, each customer can only process one pull API request at a time. Whilst a request is processing, any further incoming requests are held in a queue, then processed in order as the previous one finishes.
> If at any time, a request has been held up for 60 seconds, further requests result in the 429 error and they are discarded.
> 
> If this occurs, there are a number of tactics you can use to shorten individual response times or make less requests - please get in touch if you need help.

### Security
Note that you won't be able to make calls to Agilebase APIs using Javascript from web browsers. You'll only be able to use server-side technologies to call these 'pull' APIs, or third party tools such as Zapier or Microsoft Power Automate.

The reason is that browsers block access for security reasons. The API typically needs an Authorization key to work, which can be hidden from users if the call is made server-side, but which can't if it's done from the browser. If that was allowed, any user of the website could find the Authorization key and make it public. Please see the [discussion here](https://stackoverflow.com/questions/11470389/how-to-protect-an-api-key-when-using-javascript) for further details. 

### Generate API descriptions
For developers who use the Agilebase API to create and update data within Agilebase from a third party product, there’s now a way to further automate the process.

Agilebase will now generate a [OpenAPI](https://www.openapis.org/) compatible API description of the view. 

When editing the view, in the _Use API_ panel, go to _OpenAPI Definition_ and you'll be able to download it.

Alternatively, for anyone without an Agilebase login, make a GET request to

/Agilebase/Public.ab with parameters

* c = the company identifier (the table options screen will show this)
* t = the table identifier (similarly shown by the options screen)
* r = the view identifier
* describe_report = true

and the ‘Authorization’ header set to the API key (if the table requires one).

This also makes testing with [Postman](https://www.postman.com/) easier, since Postman can import a OpenAPI API description. You don’t have to write a single line of code to test out an API.