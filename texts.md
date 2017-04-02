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
Since I started developing for iOS in 2012 I've been very passionate about the abilities it gave me and I couldn't help, but tell all my friends and family about the projects I was working on. I'm still amazed by all the possibilities that mobile platforms in general, but iOS above all, have to offer.
In 2013, 2014 and 2015 I took part in *Jugend Hackt*, a hackathon for young developers in Berlin and together with two other students (and past WWDC scholarship recipients) from Germany developed apps that would help people by utilising the given data and our coding knowledge. We put together an app to spot so-called *"Stolpersteine"* - small stones in the floor as reminders of the holocaust - because we think it's important to be reminded of the past in order not to repeat mistakes.
Later in 2015 I helped develop *"Moin refugees"*, another iOS app to help refugees that just came to Germany for shelter settle in and also gave the residents the ability to help in the camps or donate.
My passion for cutting edge technology led to me constantly telling my siblings and parents about all the new developments - be it the introduction of touch screens, brand new ways to interaction (Leap Motion), Virtual reality devices or wearables - I'm pretty sure even though they seem annoyed by my excessive enthusiasm, at some point I aroused their interest in those topics, and that is all I can ask for.
Since getting a little bit famous for some of my apps I am often asked how people can start to learn to code and I'm always really happy to show them all the resources I found and also help with questions they might have along the way.

## Comments
Attending WWDC in 2015 was a very special experience for me, not only because travelling around the bay area and visiting headquarters of famous companies is awesome, but also because I met so so many incredibly smart and kind people from all over the globe, all working in a similar sector of technology. 
Now don't get me wrong, I learned a lot about the new technologies Apple presented that year, but the amount of new ways to work, resources to look into, job opportunities, connections to people in other companies and moreover the fun I had those ten days outweighs that by far and I would do anything to be able to do it again this year.
Please feel free to contact me anytime via mail (finn.gaida@me.com) or phone (+49 157 36242586), I'll be happy to answer any questions or supply you with more information.
Also for references to the projects I talked about in the *Beyond WWDC* text, most of them can be found on my GitHub account (github.com/finngaida).