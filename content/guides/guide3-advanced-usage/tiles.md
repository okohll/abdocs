---
title: "Guide 3.1 - Tiles: Advanced UI Control"
date: 2023-10-17T13:00:00+01:00
type: docs
weight: 40
description: "Tiles - A look at how to control the starting point of UI/UX across agileBase"
tags:
- System Architect
- Junior System Architect

---

## Tiles

A tile on a user’s home screen represents an application or module of an application. It is a collection of data and functionality that forms a coherent whole
[For detailed information about Tiles visit]({{<relref "/docs/tiles">}})

Let’s start by looking at the collection of tiles this system has configured
Using the developer interface you can access your list of current tiles.
![Developer view - list of tiles](/tile-list.png)

Clicking on one provides access to the configuration options.
![Tile details](/tile-individual-details.png)

Obviously setting the title is key as it provides the primary information to the user as to what purpose it serves.
You can provide a visual clue by choosing an appropriate Icon
[Video how to set an Icon]{{<youtube id="yfjLrL1xLN8">}}

We would also suggest you set a description for the tile.
This will appear as a hover over when your user places their cursor above it. Consider it as the first level of user help and should answer the question "What functionality does this tile contain?"

You can control the order the tile appears by setting an index number.
Additionally you can provide "breaks" in the list of tiles by giving them a section. You can see how this affects the UI below
![Tile with sections](/tile-with-sections.png)

When assigning a tile to a user we can set a "Default View".
When choosing a default view it makes sense to aim your user towards the one they would most
frequently use. If you're not sure then the most frequently used would be a good place to start.
![Adding a tile to a user](/adding-tile-to-user.png)

