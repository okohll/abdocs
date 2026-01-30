---
title: "API response codes"
date: 2026-01-30T17:54:00+01:00
type: docs
weight: 200
description: Descriptions of the various HTTP error codes that might be returned if an API request fails
tags:
- Software Architect
- v6
---
If an API request succeeds, the standard HTTP success code, 200 will be returned as the response status.

If there is any error and the request fails, a different code will be returned.

* 400: bad request, e.g. a necessary parameter for the request is missing, such as 't' to identify a table
* 401: unauthorised e.g. the API key is missing or invalid
* 403: forbidden, e.g. an action was requested that can't be carried out in the circumstances, e.g. an attempt was made to alter a locked record
* 404: not found, an object identified in the request was not found e.g. no match was found for a table ID specified with the 't' parameter
* 409: conflict, e.g. data was supplied that doesn't pass checks, such as a date outside of the field's allowable range
* 424: failed dependency, e.g. a third party service which Agilebase calls in the process of completing an action has failed
* 429: too many requests e.g. the frequency of requests is too high, please throttle them back
* 507: insufficient storage e.g. when creating a record, the limit set on the number of records which can be stored has been reached
* 500: some other server error

When there is an error, a response header X-AB-error is also set with the type and content of the error message. That should help developers to troubleshoot and find the cause of the issue.

So if you do come across an API error, please look at the HTTP response that you get from Agilebase.

The response itself will often contain these details as well, e.g.

```
{
  "error": true,
  "type": "DisallowedException",
  "message": "User public api is not allowed to edit delete data in table my table. An administrator can set up privileges so this can be allowed"
}
```

