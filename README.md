# CalendarTests
testing precise placement of horizontal views with overlapping labels

Hello Ray & other Swifts,

Here's the test code I was struggling with Saturday 11/4. 

I've cleaned out irrelevant bits and commented extensively about what I want it to do, how I tried get it to do that, and what it's doing instead.
I will greatly appreciate any insight you can provide!

# Before you dive in too deep...

I should tell you that unless there is an obvious mistake in here, I've just about decided to abandon these labels altogether.
I may just go with un-labelled icons instead, where the circles are. 
A "meal" icon or "doctor" icon could convey as much information as a text label.
And/or I could make the event views opaque so when they overlap the top view is readable and the others are partly hidden, 
but still tappable for more info.
At any rate, I may go with an approach that doesn't involve solving the overlapping label problem at all.
Still, I'm curious to know if I'm doing something wrong vs. am I trying to do something SwiftUI wasn't designed to do?

# The larger question I've been grappling with is:
In general, can you make a view responsive to its own size and location?
Here I'm referring to a view whose size is beyond my direct control, which seems to always be the case, especially where text is involved. 
Could I make two text views change color, for example, if their edges overlap?
I think the answer is no.
Please tell me if I'm wrong, but...
I think SwiftUI can put pre-fabricated views on the screen in precise-ish ways, but it cannot find out what the size will be,
then alter the view based on that, then place the view, because it has to be in the process of placing the view before
it can tell you the size of that view. So you get circular logic. 
Me: "What's the size of this view, so I can change its attributes if needed before we put it on the screen?" 
Swift: "I don't know. Let's put it on the screen. Then I can tell you the size."
Me: "Yeah, that overlaps. Let's change it."
Swift: "I can't change it from here. It's already on the screen."

Josh's workaround is: "If it overlaps, put it on the screen way over there where we can't see it," which works if the attribute you want
to change is visibility. But for anything else, are we just out of luck?

# Other wild thoughts:
Surely apps like arcade-style games have to have more precise control over objects on screen. Could there be a solution to this in SpriteKit?
Is there some way to use geometry reader to grab sizes outside of an actual parent view, or before a view gets rendered?
Is there some other way to get the size of a view besides custom layout or geometry reader?
Could you create a very tall view that contains different versions of itself stacked vertically with lots of blank space between so that you could 
place it with a vertical offset, positioning the version you want precisely onscreen (and the others will be too far up or down to be seen)?
Just kidding - I know that's wacky, hacky, or mad genius, or some kind of thing the coding gods would strike me down for!

If you read this far, dang! Thanks!

