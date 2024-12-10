---
title: "Authenticating users via the API"
date: 2021-01-19T12:41:00+01:00
type: docs
weight: 190
description: Logging in as a user
tags:
- Software Architect
- v6
---
Sometimes when developing an app that integrates with Agilebase, you may want to allow it to query the system to check the login details a user provides. In other words, let a user 'log in' via your app.

The API mechanisms described in this section (push, pull etc.) don't require a login to use, they work only via the API keys as described, however your app may still wish to test a users login to ensure they are a valid user.

There are two approaches you can take to this. Which you select will probably depend on the capabilities of the third party language or platform - which it is able to do most easily.

### 1) Perform an actual log in

To do this, the third party app must act exactly as if it were a web browser allowing the user to log in. In other words it must follow this process:

1) Visit https://cloud.agilebase.co.uk/agileBase/AppController.servlet?return=user_details
2) The page will return a login form and a cookie JSESSIONID
3) Post the form i.e. submit values j_username and j_password, along with the cookie
4) If the username and password are correct, a JSON object will be returned in the response, containing the user's details. If not, an error page will be returned

### 2) Use social login and match on the email address

Many platforms now allow you to perform authentication with Google, Apple, Facebook etc. They redirect you to those company's login facilities, then once authentication is complete, back again.

You should receive a user identifier for the valid login, such as their email address.

Ensure the usernames in Agilebase match the identifiers returned.

> Note: if you can't ensure that usernames in both systems match, you can create a lookup table in Agilebase, to map one to the other, then join to that in your API views.

## Returning the correct data for the user

Either way, you should now have a user identifier for an authenticated person.

1) Include the Created By [Auto] or Modified By [Auto] fields (or a custom 'owner' field of some sort) in any API view you want to call
2) In the API call, include the user ID supplied as a filter

You will then receive only records which are 'owned' by the user provided.

> **To avoid the possibility of one person's username being a subset of another, it's recommended when filtering that you pass in the exact string as output by the Agilebase view.**
> 
> In the case of the Created By [Auto] and Modified By [Auto] fields, that will be the format `Forename Surname (username)`. If you want just the username, you can extract it with a calculation.
> 
> Then use exact filtering in the API, e.g. by prepending the filter value with an equals sign

Otherwise, you may find for example that filtering for 'alice' returns data for users 'alice.smith', 'alice@example.com' and 'louise_alice_jones'.

## Resources / Examples

These are examples for approach 1 above.

### Java
See section **Form Login with Cookies** of https://www.tutorialspoint.com/apache_httpclient/apache_httpclient_form_based_login.htm

### React
Use the 'react-cookie' package: https://www.npmjs.com/package/react-cookies

### Python
Use the 'urllib2' library: https://stackoverflow.com/questions/301924/python-urllib-urllib2-httplib-confusion'



