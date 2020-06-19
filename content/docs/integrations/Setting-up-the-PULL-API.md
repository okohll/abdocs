---
title: "Setting up the PULL API"
date: 2020-05-29T12:35:00+01:00
type: docs
weight: 140
description: Control how third party systems read data from agileBase
---

Connections to agileBase are made using standard HTTP calls. This makes it easy for developers in any language, so PHP, Java, even JavaScript in a browser can be used.

1) The first step is to create a view in agileBase that contains the data you want to make available to other apps. You can use the standard view creation features of the administrator interface, including adding fields and calculations, sorts and filters.

2) Secondly, turn on the ability for the view to be accessed via a PULL API by going to the _manage_ tab,and within the _send_ section choosing _Send data to a third party system using the API_.

3) Finally Tick the _Allow access from third party software using an API key_. 

The remainder of this article explains how to PULL the data.

![Configuring the PULL API](/workflow-pull.png)

The most important piece of information is the URL that the third party will access your data via. This will be:

https://appserver.gtportalbase.com/agileBase/Public.ab

If you host on your own cloud or on premises, this may be different.

Requests can contain a number of parameters, the one which must be supplied to use the JSON API is _get_report_json=true_ 
Other parameters to control various options are detailed below.

HTTP requests can be submitted as GET or POST.

Three parameters for the view also need to be submitted as parameters to the request. These are ‘c’, ‘t’ and ‘r’, the values are displayed in the administrator interface (see screenshot above). Together, these identify the view from which to extract data.

Finally, the API key provided needs to be submitted not as a HTTP request parameter, but as a header named ‘Authorization’. This is to reduce the change of it being cached or used in a browser string where it can be easily retained and read by unauthorised users.

Here’s a complete example of making a request, using PHP in WordPress

[php]
```
$url = 'http://appserver.gtportalbase.com/agileBase/Public.ab?get_report_json=true&simple_format=true&t=mytablecode&r=myreportcode&c=mycompanycode&json_format=json';

$args = array('headers' => array( 'Authorization' => 'myauthorisationkey'));

$response = wp_remote_get( $url, $args );

var_dump($response);
```
[/php]

Sample output would look like
```
[
  {
    forename: "Oliver",
    surname: "Kohll",
    email_address: "oliver@agilebase.co.uk"
  },
  {
    forename: "Simon",
    surname: "Minton",
    email_address: "simon@agilebase.co.uk"
  },
  {
    forename: "Cliff",
    surname: "Calcutt",
    email_address: "cliff@agilebase.co.uk"
  }
]
```

- of course the fields being those returned for the particular view chosen.

### Request options

Here are the options that can be provided as parameters to the request, along with the c, t and r identifiers and in addition to get_report_json=true.

#### simple_format=true/false (default false)
This option controls the JSON format returned. With simple_format=true, the response will be a simple array of objects, each containing keys for the field namesm as above. Keys are basically lowercase field names with spaces replaced by underscores, so “Email address” would become “email_address”
With simple_format=false, a more complex but more robust format it used. Rather than field names, internal agileBase field identifiers are used as keys. This has the advantage that if the field names are changed (easy for an agileBase administrator to do), the JSON will remain the same. The first object in the JSON will be a dictionary mapping internal identifier to field name.

#### json_format=json
With this option, just the JSON will be returned. This is the usual case required. Without it, complete Javascript will be returned defining the JSON as an object, i.e. `var abJson=[…]` which can be useful if you want to run the result as Javascript.

#### return=posted_json
Optional, if this is included, the return content will be JSON including the ID of the record as well as the full content of the data.

#### cache_seconds=[seconds]
How long to cache the results for (default 600 seconds or 10 minutes). Only un-filtered results are cached.

#### unencode_html=true
Causes characters which would normally be encoded as HTML entities (e.g. `&` -> `&amp;`) to be returned unencoded

#### exact_filters=true/false (default false)
If true, filters (see below) will be need to match results exactly instead of using the default 'contains' filtering

#### row_limit=[row limit]
The default limit on the number of records to ruturn is 10,000. Add this parameter to change this. Note the hard maximum allowed is 100,000.

### Filtering

By specifying exact_filters=true, filters can be supplied to search for a particular record or set of records. For HTTP parameter names, just use the internal agileBase field identifiers. The easiest way of finding these is to right click on a field in the administrator interface using a browser like Chrome, Safari or Firefox and select ‘inspect element’.

Standard agileBase quick filters can be used for preparing complex criteria on multiple fields, for example in each field using “?” to find blank records, > and < for numbers and date ranges, phrases like “last month” for dates, “=[word]” for exact matches, “:word” for starts with, and “!word” for doesn’t contain.

### Response codes

* 200: request successful
* 401: unauthorised: the API key is missing or incorrect
* 404: not found: an object identifier (company ID, table ID or report ID) was supplied that wasn’t found in the system
* 429: too many requests: the frequency of requests is too high, please throttle them back
* 500: some other server error

When there is an error, the X-AB-error header will be set and JSON returned representing the error, as happens with the [POST API]({{<relref "Setting-up-the-POST-API#response">}}).

### Generate API descriptions
For developers who use the agileBase API to create and update data within agileBase from a third party product, there’s now a way to further automate the process.

agileBase will now generate a [swagger.io](https://swagger.io/) compatible API description of any table you want to post to. That means if you deal with accounts for many agileBase customers, you can with a common query get the API details needed to interact with them.

Just make a POST request to

/agileBase/Public.ab with parameters

* c = the company identifier (the table options screen will show this)
* t = the table identifier (similarly shown by the options screen)
* describe_table = true

and the ‘Authorization’ header set to the API key (if the table requires one).

This also makes testing with [Postman](https://www.postman.com/) easier, since Postman can import a Swagger API description – so you don’t have to write a single line of code to test out an API.

## RSS Feed

If your PULL API has been enabled for Public access then you can offer 3rd parties the option of accessing the feed via an RSS feed. The link is visible just below the tick box for public access.

![Configuring the PULL API](/workflow-send-rss.png)