---
title: "Recursive Workflows"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 220
description: Recursively Firing Workflows
---

Recursion is a rather heavyweight feature of the workflow capabilities of the agileBase platform.

If you’re interested in a bit of maths and want to know what that means, there’s a great [tutorial about the concept at the Khan Academy](https://www.khanacademy.org/computing/computer-science/algorithms/recursive-algorithms/a/recursion).

If not, never mind, the takeaway is it allows an administrator to set up workflows that weren’t possible before, particularly where you have networks of people or things. For example, if your CRM links people who know each other, you could create a list of all people 1 step removed, 2 steps etc.

More generally, any calculation with a repetitive step that depends on the results of the previous repetition is recursive. For example, solving sudokus or to some extent crosswords. In fact, we have a sudoku solver as one of our demos.

## Worked example – an ingredients declaration
Here’s an example that may be a useful pattern for reference. We have a recipe with quantities of each ingredient. However, an ingredient may itself also be a recipe containing other ingredients. We wish to calculate an ‘ingredients declaration’ which has a list of all ‘raw ingredients’ at the end of the chain i.e. those with no recipe and their percentages in the initial recipe.

This can (and has) been done with a some linked workflows including a couple of recursive steps. Here’s the logic (not including technical implementation details).

1) Step 1

Firstly, with for our main recipe (let’s call it Tom Yum Soup), look at all the direct ingredients and make a copy list, we’ll call it the _exploded ingredients_. After this step it will just be exactly the same ingredients as the main list, but later on we’ll recurse and add ingredients of ingredients.

In agileBase parlance, a workflow will copy all the items from an _ingredient lines_ table to an _exploded ingredient lines_ table. Each exploded ingredient line will have

* a link to the main recipe, i.e. Tom Yum Soup
* a link to it’s corresponding ingredient line e.g. 10 grams of chilli paste
* a link to the ‘parent exploded line’, which will just be empty in this first step

2) Step 2

Go through each of the exploded ingredient lines. For each one, if the ingredient is itself a recipe, add lines for each of it’s ingredients, setting

main recipe = the same main recipe as the existing exploded line, i.e. Tom Yum Soup
link to parent ingredient line = the line we’re looking at e.g. 10 grams chilli paste
link to ingredient line = e.g. 7 grams crushed chillies
Now recurse and do step 2 again, for any of the new exploded ingredient lines that are themselves recipes. Repeat 2 as many times as are necessary until there are no new lines which are recipes. **This is the key step – after this you’ll have a complete list of raw ingredients.**

To make agileBase do that, simply tick the _recursive_ checkbox in the view’s workflow section. It will repeat the step until the view contains no records.

3) Step 3

The only thing left is to fill in the percentages. This involves a similar logic – bootstrap by first filling in percentages copied from the direct ingredients of the main recipe, then in a new workflow calculate the percentage of sub-ingredients by multiplying the proportion of the main ingredient by the percentage in the sub-ingredient. So for example if our Tom Yum is 2% chilli paste, which contains 70% crushed chillies, the percentage of crushed chillies in the Tom Yum is 0.02 x 70 = 1.4%.

When implementing, there are a couple of other details to take into consideration, e.g. how to mark each exploded line as ‘processed’ so you don’t keep on re-calculating them. We do that with a counter. You also have to deal with the mechanics of things like what to do if a recipe changes e.g. an ingredient is deleted – another recursive workflow will go through and delete all exploded lines including sub-ingredients.

If you’d like to see a full implementation details for this example, please let us know and we can take you through it on our demo system.

4) Step 4

Finally, the ingredient declaration to e.g. go on a label can be calculated by joining together the names of all the raw ingredients i.e. the exploded ingredients that aren’t themselves recipes, along with their percentages.



