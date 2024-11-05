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

To do that, the third party app must act exactly as if it were a web browser allowing the user to log in. In other words it must follow this process:

1) Visit https://cloud.agilebase.co.uk/agileBase/AppController.servlet?return=user_details
2) The page will return a login form and a cookie JSESSIONID
3) Post the form i.e. submit values j_username and j_password, along with the cookie
4) If the username and password are correct, a JSON object will be returned in the response, containing the user's details. If not, an error page will be returned

## Resources / Examples

### Java
See section **Form Login with Cookies** of https://www.tutorialspoint.com/apache_httpclient/apache_httpclient_form_based_login.htm

### React
Use the 'react-cookie' package: https://www.npmjs.com/package/react-cookies

### Python
Use the 'urllib2' library: https://stackoverflow.com/questions/301924/python-urllib-urllib2-httplib-confusion'



