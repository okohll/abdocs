---
title: "File Field Options"
date: 2020-06-04T16:40:00+01:00
type: docs
weight: 130
description: Options specific to file fields, including for generating documents
tags:
- Junior Software Architect
---
## Type
The type of document typically stored by this field. Can be
* Document - such as a PDF file or spreadsheet for example
* Image/photo
* Profile photo

The selection affects the display in the user interface in some ways. In particular when a profile photo field is moved to the start of the record, it is displayed as part of the record header.

## Image resolution
This option allows you to specify that the system should automatically down-size any large images uploaded. This could be to save storage space (for which there is a cost), or it may be appropriate if these files are going to be attached to emails sent by the system.

## Template
Type the name of a template to be used for [generating PDF documents]({{<relref "/docs/fields/field-types/special-field-types/file/document-templates">}}) to be stored in this field.

## View to use
The system will look in this view for a template with the name specified above.

## Paper size
When a PDF is generated, base it on this size of paper. The default is A4, changing this can be useful if e.g. you want to use the system to print labels.

## Zoom %
Setting this to smaller than 100 will make text and other content appear smaller on the page, similarly larger bigger

## Footer
Optionally, add a footer to every page of a generated document, including e.g. the name of the document, page number and total number of pages.

If you like, you can define a completely custom footer in HTML. Add a `<div>` element to your HTML template with the id 'ab_pdf_footer'.
The footer element may use only inline CSS styles, classes will be ignored. However, so the footer element *only* appears in the footer, we suggest adding a class to it to hide it in the main document, for example

```css
.display-none {
    display: none;
}
```

You can use `<span class='pageNumber'></span>` to output the current page number in the template and `<span class='totalPages'></span>` for the total number of pages.

If you don't define a custom footer via a `<div id='ab_pdf_footer'>` element, then the following will be used:

```html
<div id='ab_pdf_footer' style='font-size: 8pt; width: 100%; text-align: center'>[title] - page <span class='pageNumber'></span> of <span class='totalPages'></span></div>
```

where `[title]` is the contents of the first (non-ID) field in the ‘view to use’ (see above), so you can set it to whatever you like. A calculation can be used if required.
