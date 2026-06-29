---
title: "Scratchpad - Passkeys development"
date: 2026-06-29T09:57:55+01:00
type: docs
weight: 900
description: Temporary location of a request for developers
---
# Passkeys
We have a bespoke Java application running in a servlet container (currently Tomcat 10). The authentication is form based, with an additional 2FA solution using a one-time-password library. The form authentication uses the container's built in realm based authentication, with a BCrypt realm to hash passwords which we have supplied - the only component which is not out of the box for Tomcat.

The aim is to allow users to choose to log in with passkeys *instead of* a username and password.

For a background on passkeys: https://www.youtube.com/watch?v=otObbUSxcqs

The intention is to stay away from 'enterprise' libraries like Spring, rather to use those which are lightweight, require a relatively low investment in time, follow widely used standards and ideally have a long lifetime. Agilebase itself has been around for a couple of decades.

## Approach
The idea is to
1) replicate a basic 'hello world' application using the current login method exactly as Agilebase currently does, i.e. a form based login with a Bcrypt Tomcat realm back-end
2) add the facility to alternatively use passkeys authentication
3) work out in collaboration with us some mechanism of allowing individual users to switch between the two at their preference

## Part 1 - 'hello world' form based authentication
Complete examples of the below files are included in the repository. For explanation, snippets of them are below.

The application's `WEB-INF/web.xml` has a security constraint to define the form based authentication:

```xml
 <security-constraint>
      <web-resource-collection>
        <web-resource-name>Agilebase Application</web-resource-name>
        <url-pattern>/application/*</url-pattern>
      </web-resource-collection>
      <auth-constraint>
        <role-name>everyone</role-name>
      </auth-constraint>
    </security-constraint>
    <login-config>
      <auth-method>FORM</auth-method>
      <form-login-config>
        <form-login-page>index.jsp</form-login-page>
        <form-error-page>error.jsp</form-error-page>
      </form-login-config>
    </login-config>
```

and on the server side, `/etc/tomcat10/server.xml` has

```xml
 <Context path="/agileBase">  
  <Realm className="com.gtwm.pb.auth.BCryptRealm"
              dataSourceName="jdbc/agileBaseSchema"
              localDataSource="true" userTable="users"
              userNameCol="username" userCredCol="password"
              userRoleTable="user_roles" roleNameCol="rolename" />
  </Realm>
</Context>
```

The database for storing usernames and hashed passwords can be created with SQL

```sql
CREATE TABLE appuser(username text, password text, forename text, surname text);
INSERT INTO appuser(username, password, forename, surname) VALUES ('test', '[bcrypt hashed password]', 'Test', 'Test');
```

and we don't use the built in roles mechanism, so

```sql
CREATE VIEW user_roles AS (SELECT username, 'everyone' AS rolename) FROM appuser;
```

The bcrypt library goes (in Tomcat installed under Ubuntu at least) in `/usr/share/tomcat10/lib/BCryptRealm.jar`.

We can set up a Tomcat server with this configuration, or you can use your own.

The application should verify that someone has logged in with a call in the servlet to `HttpServletRequest#getRemoteUser`, e.g. something like

```java
public void doGet(HttpServletRequest request, HttpServletResponse response) {
    String username = request.getRemoteUser();
    response.getWriter().write("The username of the logged in person is " + username);
}
```

Once that's working and someone can log in to a dummy app which just shows a static message, we can look at the meat of the project:

## Part 2 - Passkeys
### Options
#### Keycloak - https://www.keycloak.org
Pros
* provides all sort of other authentication mechanisms like single signon as well
* well established so integrations methods are well trodden

Cons
* we're not interested in any of those other mechanisms, only passkeys therefore bloated

#### Hanko - https://www.hanko.io
Pros
* modern
* minimalist

Cons
* generic implementation mechanism seems at first glance a bit strange or not particularly obvious (every HTTP request passes through?), though that may be just me

#### Others?
We do not have much internal knowledge of Passkeys or Java authentication libraries in general, so additional thoughts re the above or any other options are welcome

## Resources
Full versions of the configuration files mentioned above are in the `resources` folder - they are copied from an existing system so will need some small amount of tweaking for use with a new minimal test application.

We can provide an Ubuntu Linux VPS development server if necessary.

## Outcome
For this project, the serverside only needs to be fully developed. The clientside UI needs to be developed only to the extent that the serverside can be fully tested.

In other words, we don't need a pretty or accessibility tested login UI - we have client-side developers who can work on that.

We'd like
1) a working passkeys setup
2) a mechanism, or at least an understanding of a plausible mechanism for allowing a user to switch between using username/password and passkeys

Agilebase has a mechanism to retrieve a full user object given a username, so it's likely we'll need an equivalent to `HttpServletRequest#getRemoteUser` used above for the passkeys implementation to return the username string.

## Agreements
Before starting, we'll need the developer to agree to assign all IP ownership of code to Agilebase Ltd and also sign a Non Disclosure Agreement. Documents to cover those things can be supplied on request.