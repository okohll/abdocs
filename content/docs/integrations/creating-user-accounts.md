---
title: "Creating user accounts with the API"
date: 2021-04-14T10:41:00+01:00
type: docs
weight: 200
description: Creating a user account in a multi-tenanted system with an API request
tags:
- Principal Architect
---
Normally, a user account can only be created by a system administrator - see [adding a user]({{<relref "/docs/security-and-compliance/security-features/users#adding-a-user">}}).

However there's one special case in which the organisation runs a [multi-tenanted]({{<relref "/docs/security-and-compliance/security-features/roles#multi-tenanting">}}) agileBase account. In that case, you can use an API call to create a new tenant in the account and new user(s) for that tenant.

For example, imagine your organisation is a body for football clubs around the country, where each club was a tenant, i.e. each club had users who could log in, but only see data from their own club. In that case, the user creation API could be called to 
1) create a new club
2) create an initial user (or users) for that club

## Preparation
Before calling the API, you have to configure the system to allow it to be used. In the administrator user interface:
1) Expand the _Administration_ menu in the lefthand sidebar
2) Click _company_
3) Click your company name then the pencil icon in the toolbar to edit the details

In *Multi-tenanting field name (optional)*, type in the field name that your system uses to differentiate tenants, e.g. "account name". See [multi-tenanting]({{<relref "/docs/security-and-compliance/security-features/roles#multi-tenanting">}})

Refresh the page and an API key will appear. We will need this to call the API as below.
> To disable the API at any point, just delete the value you entered into *Multi-tenanting field name (optional)*

## Calling the API

Use URL https://ab.agilechilli.com/agileBase/Public.ab. You should make a [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) request with encoding `application/x-www-form-urlencoded`.

The `Authorization` header needs to be set to the API key as above.

The following paramaters are required

1. c: this identifies your company account and will always be the same. It will be shown in the company editing screen used in preparation, above
2. create_tenant: true
3. json

The value of the json parameter is a JSON object, defined below.

In the below format, `multi-tenanting fieldname` is the name of the field used to differentiate tenants with spaces replaced with underscores, e.g. 'account_name'. The `multi-tenanting value` is the name of the tenant you wish to create with this particular API call. A multi-tenanting role will be created named 'cust `multi-tenanting value`'. E.g. if the value is 'spurs', the role will be named 'cust spurs'. The value should be a lowercase string consisting only of letters from a through to z and numbers.

The `users` property is an array of users. Each user will be created and assigned to the above multi-tenanting role, so they can only see data belonging to them and other users of that role. The user will need a valid `email address` in order to perform a password reset so they can log in.

The `customui` property refers to the option to [apply a custom logo and login screen]({{<relref "/docs/security-and-compliance/security-features/users/#use-the-custom-agilechilli-ui-rather-than-agilebases">}})

For each user, the `roles` parameter is a comma separated list of internal role IDs, or role names. In addition to the multi-tenanting role, they will also be assigned these roles. They could be e.g. 'manager', 'sales rep' or 'accounts dept'.

For each user, `tiles` is an array of the tiles the user should see on screen when they log in.

```
{
  "[multi-tenanting fieldname]": "[multi-tenanting value]",
  "users": [
    {
      "username": "[username",
      "forename": "[forename]",
      "surname": "[surname]",
      "email": "[email address]",
      "customui": [true/false],
      "roles": "[comma separated list of role names]",
      "tiles": [
        {
          "tiletype": "comment_stream / calendar / data_link / files",
          "colour": "blue / yellow / green / purple / pink / turquoise / blue2 / yellow2 / green2 / purple2 / pink2 / turquoise2",
          "internaltilename": "[for data_link or files tiles, identifies the tile to add]"
        },
        { ... }
      ]
    }
  ]
}
```

On a successful call, the JSON

```
{
"result": "ok"
}
```

will be returned, with a 200 HTTP status code. If there is an error,

```
{
"error": true,
"type": "[class of error]",
"message": "[error message]"
}
```

will be returned and the HTTP status code will reflect the error.