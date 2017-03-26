# WWDC 2017
## Playground
*Tell us about the features and technologies that you used in your Swift playground, in 500 words or less*.
In order to explain the characteristics and features of a basic oscilloscope my playground mostly uses the `UIKit` and `CoreAnimation` frameworks.
There are two *container classes*, `Display` and `Sideview`. The display represents the screen of the oscilloscope and more interestingly the shapes it can display. The grid is created by drawing some `UIBezierPaths` as is the actual shape in a light blue color. It then uses that path to animate the image of the spark along the curve repeatedly.
Whats's special about this approach is that the user can specify a custom `x` and `y` function, so by default the x-function is linear (time) and the y function is prefilled with a sine wave. By changing these properties you can explore the possibilities of superimposing two functions. 
The path is created by asking the x and y closures for their value on the scale from -1 to 1 which is what the screen can display (-1 being the left and bottom and 1 the right and top).
The sideview creates and assembles all the interior parts of the oscilloscope to visualise its internal structure. Every element is itself a subclass of `UIView`, so it can easily be added as a subview to the sideview.
Let's go over the components one by one:
The `Cathode` is very interesting, as the filament is drawn from a `UIBezierPath` and the emitted electrons are depicted by a `CAEmitterCell`. At first I was thinking about using an `SKEmitterNode`, but as I mostly use CoreGraphics to draw my views, adding `SpriteKit` to the project was not worth the effort, besides the `CAEmitterCell` actually looking more like what I was looking for.
The `Anode` is not that special, just some basic use of setting the view's background color and border color.
Next is the deflection system, which is basically two instances of the `Plate` class next to each other. Now in this class the plates itself are just a `CALayer` with a calculated path to create this 3D-effect and the fill and and border colors set. The vertical dashed lines are also bezier paths with the line dash pattern set accordingly.
One technically challenging thing about this class is the `createPath()` function which will create the bezier path for the electron beam, given the right parameters. In order to create this method I had to dig deep into my high school physics notes and even went back to school to ask my old teacher about it, but in the end I just had to adjust a formula to suit my needs.
The `Screen` is literally a single view with the background color set to the display background color.
I also made use of the `PlaygroundBook` format in order to create editable code sections and customise the autocompletions.

## Beyond
*Let us know how you've considered sharing your coding knowledge and enthusiasm for computer science with others, in 500 words or less*.
