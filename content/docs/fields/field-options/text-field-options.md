---
title: "Text Field Options"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 60
description: Options specific to text fields
---
## Colour words
When this field is included in a view, highlight it with a colour if the content is one of a number of words. The most up-to-date values to be highlighted are shown in the administrator interface, but as of the latest update of this page, they are

![Word Colours](/word-colours.png)

> Text calculations can also be coloured based on the same words - see the [calculation options]({{<relref "/docs/views/calculations#colouring">}})

## Default value
For basic text fields, this simply provides a default value, which the field will have when a record's created. If not provided, the field will be blank.

> Field defaults can also be calculated, with a simple or arbitratily complex calculation. To do that, instead use the [Set from previous referenced field]({{<relref "common-options#set-from-previous-referenced-field">}}) option.

### Specifying dropdown lists and tags fields
If either [Use dropdown]({{<relref "#use-dropdown">}}) or [Use tags]({{<relref "#use-tags">}}) is selected, the default value option provides a **list** of options with which to populate the dropdown, or a set of tags to choose from. Enter each option here separated by commas.

If the list **starts with** a comma, that means the field should be blank by default when a record is created. If not, then the default will be the first value in the comma separated list.

In the dropdown/tags list, the options will be ordered alphabetically, not shown in the order they're entered in. If you wish to give the values a particular order, you can prefix them with a number or letter followed by a closing bracket like so: `1) cold, 2) warm, 3) hot`. The number prefixes won't show to the user.

#### Lists of users
Also for dropdown lists and tags fields, agileBase can generate dropdown contents based on a list of users and/or roles in the system. To do that, select `users` or `users and roles` from the 'fill with' selector just below the default value input. The standard user ID format throughout the system is used, 'Forename Surname (username)'.

Only users/roles which have privileges to view the data in this particular table will be shown in the list. That can keep things manageable if a system has hundreds or more users.

> An example use would be assigning an account manager to a customer, selecting from a list of staff members (who are users).

When a user is selected in this way, more options for use are opened up, such as automatically emailing the selected person when there's a status change or something is overdue for example. agileBase can look up the user's email address to accomplish this, See [email workflows]({{<relref "/docs/workflows/send-email">}}) for details.

## Use dropdown
Rather than a simple text entry field, display a dropdown of choices from which one can be selected. If there are only a few values, then the user interface may display options in [radio button](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio) style, but the behaviour is exactly the same.

Options can be provided with the [default value]({{<relref "#default-value">}}) setting as above. If no options are specified, then the list of options will be automatically generated from the set of unique values **already entered** into records. In this way, a set of values will gradually grow as people enter new data.

See also the [Use only given values]({{<relref "#use-only-given-values">}}) option below to enforce the use of provided values only.

## Use tags
Similar to Use dropdown, but rather than only letting the user select one value, multiple values can be chosen at once.

> An example use may be selecting countries of origin for an ingredient, where it may come from different countries (perhaps via different suppliers).

The list of available options is specified in exactly the same way as for dropdowns above.

## Use only given values
If a dropdown or tags list is used as above, ticking this option enforces the use of one of the provided values.

If it's un-ticked, then an 'add new entry' option will be available for users to manually add values which aren't yet in the list. Added values will be visible to all.

> In some circumstances, it can be useful to leave this un-ticked and let options grow organically, until a certain point. Administrators can then rationalise and 'hard-code' values from the most commonly entered. In other situations, it may be best to specify available options right from the start.

## Text case
Convert people's input into the required case as it's entered - choose from
* lowercase
* UPPERCASE
* Title Case

## Size
If 'short' is chosen, a standard single line input box is displayed.

If 'large' is chosen, a multi-line text entry box is shown. This option also lets people format the text entered, such as using **bold**, _italics_ or bullet points. For data security reasons, only certain formatting is allowed.

## Use as record title
The user interface has the ability to highlight the importance of certain fields by showing their contents in large font at the top of the record data. For example, a Company Name field may be the record title for an organisation record.

This option can be selected for multiple fields in a table. In that case, the first field will be the main title, others will appear as subtitles.