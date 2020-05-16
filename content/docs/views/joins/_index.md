---
title: "Joins"
date: 2020-05-13T16:40:00+01:00
type: docs
weight: 70
description: Using joins to merge data from multiple sources into one view
---
Without any joins, you can only add [fields](https://todo.com), [filters](https://todo.com) and [calculations](https://todo.com) (display data in other words), from a view's parent table - the one it was created from. When joins are added to other tables or views, you can also bring in data from any table or view joined to.

For example, a view based on the contacts table could join to organisations (as long as there is a [relation field]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}) from contacts to organisations). You could then add in organisation name to the view, as well as fields like contact name, phone number and email address.

Or for a more complex example, if you start with a view from a recipes table, you could potentially join down to ingredients, then on again to allergens of those ingredients, allowing you to work out with a calculation the complete list of allergens in any recipe.

Any number of joins to different tables or views can be added to a view.

## Complex joins
As above, agileBase automatically suggests joins to data that's related to the current view's parent table as well as any of the tables already joined to. It uses [relation field]({{<relref "/docs/fields/field-types/basic-field-types#relation">}}) to see what's related.

However, sometimes you may want to join to a table or view that's not automatically suggested. These examples may become increasingly 'niche' but they are a useful reference for similar situations you may come across.

### Joining to a view
Joins to views aren't automatically suggested, but you can still add them.

> When might this be useful? Well one example is if you have a view containing a complex calculation and you wish to include the results of that calculation in lots of other views in different places.
> 
> Say you calculate various nutritional values of a recipe, such as the energy, salt and fats contents. You may wish to display that information in a few views for different people to query, as well as include them in product specification documents (which can be generated from a [workflow view](https://todo.com) and perhaps product labels as well, using a view to send data to third party labelling equipment using an [API](https://todo.com)).

To add a join to a view:
1) In the tiles interface, load the view you wish to edit (add a join to)
2) Click your user profile icon at the top right and select _admin - edit view_
3) Under _Joins_, click the _Add Join_ button
4) Under _Advanced Add Join_, select the left source and field, the right source and field, then press _Add_

The last step is the only one different to the normal join addition process, and the one that needs a little explanation

* The **left** source is the table or view to join from. Often (and by default), this will be the view's parent table
* The *left field* is the view from the lefthand table to match on. Often (and by default) this is the table's ID field. If you're joining on a relation, choose the relation field
* The **right** source is the table or view to join to
* The **right field** is the field to match. This will usually be a table ID field. If you chose an ID field for the left field, then choose the same ID field in the target view. If the left field is a relation, choose the ID of the table it relates to on the right

#### Example
To take the example above of the nutritional calculations, assume we have a view called 'nutritional values', built from a 'recipes' table. To include nutritional data in another view 'recipe details', also built from the recipes table, we would edit recipe details and add a join as follows:
* Left source: the recipes table
* Left field: the ID:recipes field
* Right source: the nutritional values view
* Right field: the ID:recipes field

### Joining on a field other than the ID
On occasion, you may wish to join to another table on data that is present in this and the other.

For an example, imagine our business opens a series of restaurants - we have a table 'restaurants' listing them. We may have a table of people who've signed up to our newsletter, called 'newsletter signups'. Some of them may have provided a postcode.

To find a list of people in the same postcode areas as each restaurant (the first half of a postcode, e.g. BS1):
1) in a view 'restaurant locations', built from the restaurants table, create a calculation 'postcode area', which picks out the first part of the restaurant's postcode (see [calculations](https://todo.com) for how to create a calculation)
2) in a view 'all newsletter signups', from the table newsletter signups, create a similar calculation, called 'signup postcode area'
3) from the view 'all newsletter signups', create a join with
    - left source: the **all newsletter signups** view
    - left field: **signup postcode area**
    - right source: the **restaurant locations** view
    - right field: **postcode area**

You'll then be able to add the name of the restaurant(s) in each signup's area to the view. This could be to send them a special offer for their local restaurant for example.

As you can see, this also demonstrates creating a join on a calculation.

> When you make a join on a field or calculation that isn't an ID, be careful to ensure that the data is **exactly the same** on both sides. In this example, the postcode fields on both sides must be the same case (e.g. uppercase). Otherwise they won't be picked up in the match.

### Joining on multiple fields
Extending 'creating a join on a calculation' from the above example, here we can use a calculation to create a **composite field** to join on. This can be used when you want to join on a number of fields at once, not just one.

This can sometimes be useful in financial reporting. Our example here is creating a report totalling up sales by product by month. The twist is we also want to include product/month combinations in which there were no sales of a particular product for the month.

We'd start by creating a view of all product/month combinations over the past 12 months. See the [series generation](https://todo.com) example in the calculations section for how to do this.

We'd then create a calculation 'product month' which would join together the product code and the month name. A similar calculation would be created in a 'sales' view, which shows individual sale lines, each with a product and month.

Finally, we'd join the two views together, the product/month combinations on the left, the sales view on the right, choosing the 'product month' calculations from each as the fields to match on.

That would enable us to create a calculation totalling sales for each product/month, including zeros where there were no sales.