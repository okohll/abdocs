---
title: "Document templates"
date: 2020-05-08T16:40:00+01:00
type: docs
weight: 100
description: Templates allow the automatic generation of PDF documents, or printouts
tags:
- Junior Software Architect
- v6
---
Document templates in Agilebase are typically used to create output that needs to be printed or emailed, for example form letters and especially anything that needs to be branded. They can be used for some quite complex and large documents, for example one customer uses them to create branded multi-page reports that are sold to customers, complete with custom fonts, layouts, images and colours.

The same templating system is used for both generating documents (which can be done automatically with a [workflow]({{<relref "/docs/workflows/send-document-generator">}}) or [manually]({{<relref "/docs/fields/field-options/file-field-options#template">}})) and displaying output to be printed.

Each template is attached to a view and given a name.

## Creating a template
Templates can be created using the built-in WYSIWYG editor, which allows simple presentation controls, like adding tables, headings and text formatting.

Alternatively and for complex needs, templates can be created manually. The templating language is [Apache Velocity](https://velocity.apache.org/), which allows concepts such as variables, loops etc. to be used, i.e. simple programming features. The output format is HTML.

1. Find or create a [view]({{<relref "/docs/views">}}) which contains the data to be included in your output document. The idea is that each row in the view will correspond to one document, with the data from that row being merged in. The view needs to be created from the parent table of the file field created for the output document
2. Toggle to development mode and click the top left pencil icon to edit the view
3. Load the 'workflow - generate PDFs' panel
4. Click CREATE to create a new blank template, then EDIT to edit it
5. Tick a file field to assign the template to that file

Then a user will see a 'generate document' button when they edit a record from the table, allowing them to generate a PDF from the template.

> Existing templates can also be edited or downloaded. Manually created templates with complex features such as variable setting and looping can't be edited using the WYSIWYG editor, but can be downloaded, edited manually then re-uploaded.

![Template creation](/document_generation.png)

### Filename
The filename of the generated document will be comprised of two parts, separated by a dash:
a) the name of the template which you created as above
b) the value of the first field in the view above

Additionally if multi-tenanting is active, then the name of the tenant associated with the record the document is being generated in will also be added, preceded by a dash.

## Including data
Each field in the view (included calculations), or parent table, can be merged in to the template by referencing the field name, preceded by a dollar sign. For convenience, a list of available fields is listed below the WYSIWYG editor, for easy copying and pasting into the template.

For those manually creating templates, a field name becomes a variable to reference by
* writing it in lower case
* replacing spaces with underscores (_)
* removing all characters that are neither letters nor numbers

Here's an example of a template being updated in the WYSYWIG editor:

![Template editing](/template-editor.png)

### Embedding images
If you have an image file in your view, you can reference it by adding _path to the variable name.

For example, if you have a file with field name "Company Logo", you could embed the image in a template with the code

```html
<img src="$company_logo_path" />
```

## Advanced templating
### Convenience features
As well as data, various convenience features are available for insertion into a template.

Here are some of the most commonly used utility functions.

| Code                                                            | Description                                                                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| $viewTools.getCalendar()                                        | Return a Java [Calendar](https://docs.oracle.com/javase/10/docs/api/java/util/Calendar.html) object representing the current date and time<br/>Also useful: $viewTools.getCalendarConstant(String name), e.g.<br>`#set($dayOfWeek = $viewTools.getCalendar().get($viewTools.getCalendarConstant("DAY_OF_WEEK")))`|                                                                                                                              |
| $viewTools.getDatestampString()                                 | Output the current date in the format 31/01/2023                                                                                                                                                                                                                                                              |
| $viewTools.getDatestampString("format")                    | Output the current date/time in a [custom format](https://docs.oracle.com/javase/10/docs/api/java/text/SimpleDateFormat.html) e.g. `$viewTools.getDatestampString("EEE, d MMM yyyy HH:mm:ss")`                                                                                                                |
| $viewTools.getDatestampString(calendar, "format") | Output the given date/time (as returned by $viewTools.getCalendar() in a custom format                                                                                                                                                                                                                                                                 |
| $viewTools.getMathTool()                                        | Return a [MathTool](https://velocity.apache.org/tools/3.0/apidocs/org/apache/velocity/tools/generic/MathTool.html) for doing maths                                                                                                                                                                            |
| $viewTools.getNumberTool()                                      | Return a [NumberTool](https://velocity.apache.org/tools/3.0/apidocs/org/apache/velocity/tools/generic/NumberTool.html) for formatting and converting numbers                                                                                                                                                  |
| $viewTools.getRandomInt(bound)                              | Return a random number >=0 and <bound                                                                                                                                                                                                                                                                         |
| $viewTools.spelloutCurrencyFromString("number")            | Convert e.g. "12.50" into "Twelve pounds 50 pence"                                                                                                                                                                                                                                                            |
| $viewTools.spelloutNumber(number)                        | Convert e.g. 1,200 into "One thousand, two hundred"                                                                                                                                                                                                                                                           |

### Complex data merging

Here are some of the most commonly used data retrieval / formatting functions.

| Code                                                              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|-------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| $view.getReportDataRows()                                         | Return all rows in the current view e.g.<br />`#set($rows = $view.getReportDataRows())`<br>`#foreach($row in $rows)`<br>`  $row.getValue("name")<br>`<br>`#end`                                                                                                                                                                                                                                                                                                                                  |
| $view.getReportDataRows(view)                                     | Return all rows in the specified view e.g.<br />`#set($myView = $view.getReport("my view"))`<br>`#set($rows = $view.getReportDataRows($myView))`                                                                                                                                                                                                                                                                                                                                                 |
| $view.getReportDataRows(view, n)                                  | Return the top n rows in the specified view                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| $view.htmlTable()                                                 | Output a HTML table containing the rows of the current session view (the last one the user opened), with session filters applied                                                                                                                                                                                                                                                                                                                                                                 |
| $view.htmlTable(view, rows)                                       | Given a list of rows as returned by getReportDataRows, from the specified view, format them as a HTML table e.g.<br>`#set($myView = $view.getReport("my view"))`<br>`#set($rows = $view.getReportDataRows($myView))`<br>`$view.htmlTable($myView, $rows)`                                                                                                                                                                                                                                        |
| $view.htmlTable("table name", "child view name")                  | For the given table, find the record being edited by the user. Filter the given view (which must contain the ID field for the table) by the ID of that record and output the rows as a HTML table. e.g.<br>`$view.htmlTable("organisations", "all contacts")`<br>might output the contacts belonging to the current organisation in the user's session                                                                                                                                           |
| $view.htmlTable("table name", "child view name", true/false)      | As above, but if true is added, include any columns which are empty for all records (they are excluded by default)                                                                                                                                                                                                                                                                                                                                                                               |
| $view.htmlTableTransverse(view, rows)                             | As per $view.htmlTable(view, rows) above, but swap the axes in the table, i.e. field names will appear down the left, each row will be output as a column                                                                                                                                                                                                                                                                                                                                        |
| $view.htmlTableTransverse("table name", "child view name")        | As per $view.htmlTable("table name", "child view name") but again with swapped axes                                                                                                                                                                                                                                                                                                                                                                                                              |
| $view.htmlTablePivot("table name", "child view name", "separator") | Create a [pivot table](https://en.wikipedia.org/wiki/Pivot_table) output. The first column in the view will be the heading (portion size in the example below). The second will be the 'vertical' category (nutrition in the example) and all other fields will be values. The 'separator' parameter is a string (text) used to join all the values to gether into one cell, if there's more than one. If unsure, try using a comma. An empty string can also be supplied, meaning no separation |
| $view.charts("table name", "view name") | Render all the charts in the given view. If you want to target the charts for CSS (sizing etc.), they will be in an element with class 'saved_charts'. Each individual chart will have the class 'summary_chart'                                                                                                                                                                                                                                                                                  |

![pivot table source data](/pivot-source.png)
*Pivot table example: source view*

![pivot table example example output](/pivot-table-example.png)
*Pivot table example: output produced from the source view*

### Session functions
Here are some of the most commonly used session functions. Each user gets a new session when they log in, it stores information about the system's current state for them.

| Code                                 | Description |
|--------------------------------------|-------------|
| $sessionData.getReport()             | Return the last view the user looked at |
| $sessionData.getTable()              | Return the last table the user looked at |
| $sessionData.getRowId()              | Return the ID of the record last loaded |
| $sessionData.getTile()               | Return the open tile |

There are many more functions than these available, indeed the whole of the Agilebase user interface is created with templates including functions of these three types.

The entire templating API is beyond the scope of this documentation but if you do wish to create any template functionality not covered by the above, it's probably possible. Please get in touch with us to discuss your needs and be pointed in the right direction.

### Using Apache Velocity features

In the examples above are some uses of simple programming code. A full reference for what you can do with the Apache Velocity language is here: https://velocity.apache.org/engine/2.3/user-guide.html
