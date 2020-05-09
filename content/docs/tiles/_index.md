---
title: "Tiles"
date: 2020-04-24T16:40:00+01:00
type: docs
weight: 20
description: Tiles on the homepage are the entry point for the user to agileBase applications
---
A tile on a user's home screen represents an application or module of an application - a collection of data and functionality that forms a coherent whole.

There are five types of tile, each of which present data in a different way.
* Data tile
    - the most common tile type - from the administrator's viewpoint this is a collection of [views](https://todo.com). The user can navigate the views, search for data, edit records etc.
* Image / document library
    - a type of data tile. Views which contain a document field can be displayed in 'card' format to show large document previews, rather than the usual 'rows' format
* Calendar
    - can display any views in the system containing date/time fields in calendar formats, such as a standard month layout, or gannt-like chart
* Visualisations
    - rather than a collection of views, displays a collection of charts
* Comment stream
    - brings together everyone's [comments]({{<relref "/docs/fields/field-types/special-field-types/comment-feeds">}}) (that a user has privileges to see) from everywhere in the system into one place. The newest comments are shown in the tile on the user's homepage. Clicking on a comment loads the record it's attached to

Data tiles need to be created by an administrator. Once a data tile is created and filled with views, it can be added to a user's screen either as a standard data tile or, if the views contain document fields, optionally as an image/document library tile.

Calendar, visualisation and comment stream tiles need not be pre-created. They are available to add to a user's screen automatically.

## Creating a tile
1. Expand the _Administration_ section in the lefthand navigation
2. Click _tiles_. You'll see a list of existing tiles
3. Click the plus button in the toolbar at the top

You should now see an editing screen with the details of the tile you just created.
![Tile editing](/tile-details.png)

The available options are
* Name - the tile name
* Section - optional. If you have a large number of tiles, you can organise them into sections. This is an aid for administrators only, it doesn't affect end users
* Index - affects the order of tiles on screen, lower numbered tiles appear before higher
* Purpose - can be used as help content to tell users about this tile
* Colour - the colour will be automatically chosen to avoid as much colour duplication as possible, however you can manually change the colour if you like, e.g. to organise similarly themed or related tiles together visually
* Icon - a tile icon can be chosen from the icon panel

> A multitude of icons are available, from [Font Awesome](https://fontawesome.com). They are constantly adding more so if you see one that's available on their website that's not in our set yet then just let us know.

## Adding views to a data tile
Data tiles need to contain one or more views to be useful. If you have no tables or views yet, you may want to check out the [Quick Start]({{<relref "quickstart">}}) guide, or see [Views](https://todo.com) for full details on view creation.

In a view's manage tab, choose the tile which you want to place it in from the _Tile_ dropdown.

## Adding and removing tiles from users
Users can themselves add tiles to their own homepages (unless they have customised UI options to prevent this). However, administrators can also do this for them.

To add a tile to a user
1. Expand the _Administration_ menu in the lefthand sidebar
2. Click _users_. Select the user you wish to edit
3. Click the _Tiles_ button
4. Select the type of tile to add.
    - If it's a data tile or document / image library tile, then also select the primary view, which is the view that will load when the user first opens the tile

### Auto-adding tiles
Tiles can also be added automatically in bulk by assigning a user role.

When editing a user, click the _Roles_ button. Next to each role listed is a list of tiles that will be added to their screen if that role is assigned to them. This is a convenience feature to speed up setting up their home screen. The tiles shown for a role are those which more than half of the members of that role have (tiles which the user already has aren't listed).

After assigning a role, if any tiles aren't needed for a particular user, they can be removed from the _Tiles_ panel for that user.

## System tiles
As an administrator, you will likely create a number of views which aren't meant to be directly visible by users, but which are for the internal workings of your applications. For example, workflows, tab views etc. - see [Views - Special Uses](https://todo.com).

To prevent users seeing these, you can put then in system tiles. A system tile is simply one which has a name starting with the word 'System'. These will only be visible to administrators. You may find it a good idea to create a number of System tiles for organisation purposes.

