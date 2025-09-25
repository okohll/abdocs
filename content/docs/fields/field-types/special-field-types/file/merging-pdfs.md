---
title: "Merging PDFs"
date: 2025-09-25T09:00:00+01:00
type: docs
weight: 101
description: Multiple PDF documents from different fields can be combined
tags:
- Junior Software Architect
- v6
---
Merging is a special case of PDF generation. It's possible to combine PDF documents from different fields and indeed different tables into one, which gets created when you press the 'generate' button or the workflow to generate a file runs.

1) Add a file field to a table, to store the combined PDF
2) Create a single view containing the file fields you want to merge, each field a separate column.
3) Edit the file field from step 1. Set the template name to '_merge' and for the 'view to use', select the view above
4) Edit the view and turn it into a document generation workflow
    1) Under 'workflow - PDFS', set or create the 'log update to' date field
   2) If you want the workflow to run automatically, also choose a frequency
