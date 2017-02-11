---
title: Fluid Type
subtitle: January 20 2017
image: /uploads/sf.jpg

layout: page
permalink: /
---

Embracing the fluid & flexible aspect of responsive web design was an easy decision, but I’ve been less sure-footed when it comes to balancing that with setting type on the web.

From a purely typographic perspective, one could argue that an adaptive approach (where we set breakpoints around fixed-width containers of text to precisely govern measure) is ideal. If a site is only text that may be true, but when images, video, or more complex multi-column layouts come into play, I find my core beliefs in the benefits of building on a [flexible foundation](http://blog.stephencaver.com/post/3467737777/building-towards-responsiveness) reaffirmed. For me, “ideal” on the web isn’t about pixel-perfection anymore, but about seeking the most pragmatic approach to balancing different kinds of content with an ever-increasing number of screen sizes and resolutions.

Here's a paragraph from *The Web Typography Handbook*:

> Sizing text in CSS is achieved using the `font-size` property. In print, font sizes are specified absolutely, for example setting text at 12 points implies a particular physical height for the printed text. On the web, font sizes can be set absolutely or relatively, and in a number of different units. What’s more, most web browsers enable the reader to resize the text to suit their own reading environment and requirements.

## Line Length

In a fluid layout, browser width and typographic measure are linked: the wider the viewport, the more characters per line. Keeping in mind that a range of [45-75 characters per line is generally accepted as safe for comfortable reading](http://www.webtypography.net/Rhythm_and_Proportion/Horizontal_Motion/2.1.2/), there are a few things that can be done to avoid extra long lines of text in fluid layouts.

### Using Media Queries

The first is using media queries to adjust the width of a container, whether for the entire site or just a column of text. For example, I might start with a site container width of 98% for single column narrow views, then gradually bump it down to 80% for full-width large screen views. Media query breakpoints and percentage amounts are, of course, dependent on the content and typefaces involved.


### Using Relative Font Sizes

The next thing I adjust at wider views is font-size. I’ll check paragraphs to see if the layout is blowing out the characters per line at any given width. When it does, I increase the font-size until things are back in that safe 45-75 range. A simple, effective trick I’ve used is dropping some lorem text into the layout with two asterisks. The first marks the 45th character, and the second marks the 75th. See below at various widths:

> Lorem ipsum dolor sit amet, consectetur adip+isicing elit, sed do eiusmod +tempor incididunt ut labore et dolore magna aliqua.

As I widen the browser window, if at any point the two asterisks appear on the same line of text, I know it’s time to increase the font size. These adjustments are easy (usually 1 CSS property) because I’ve used percentage, em, and rem (not pixel) units in my CSS.