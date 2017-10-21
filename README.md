## Übersicht widget that displays a binary clock on the desktop##

First of all I would like to thank [Felix](https://github.com/felixhageloh) for the great work on creating Übersicht and keeping on updated day after day.

**The widget**

![Binary Clock](binary-clock.gif)

**Installation**

1. Download **Übersicht** from the [official web page](http://tracesof.net/uebersicht/).
2. Unzip the download and open the **Übersicht.app** file. You should see a Getting Started widget in the center of your desktop.
3. Download this repo .zip file, unzip and put the uncompressed folder in the following location `/Users/\<username>\/Library/Application Support/Übersicht/widgets`
4. Enjoy :)

**Style modifications**

You can easily change the style of the widget by modifying some of the Stylus CSS global variables:

|Variable|Description|Values|
|-----|-----|-----|
|`display-numbers-fill`|Display the number that represents the binary sphere when it's filled out|*true* or *false*|
|`display-numbers-unfill`|Display the number that represents the binary sphere when it's not filled out|*true* or *false*|
|`sphera-fill-bg-color`|The background color of the sphere when it's filled out|Default it's *#007AFF*, should contain an hexadecimal value|
|`sphera-fill-font-color`|The color of the numbers when they are displayed inside a filled sphere|Default it's *#FFFFFF*, should contain an hexadecimal value|
|`sphera-unfill-font-color`|The color of the numbers when they are displayed inside an unfilled sphere|Default it's *#000000*, should contain an hexadecimal value|
|`top`|The margin left from the widget to the top of the desktop|Default it's 3%, can contain any CSS width compatible measure|
|`right`|The margin left from the widget to the right of the desktop|Default it's -5%, can contain any CSS width compatible measure|