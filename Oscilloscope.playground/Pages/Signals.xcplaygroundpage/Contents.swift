//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/*:
 Now this is where it gets really interesting, we now have the ability to move the electrons horizontally (by changing the voltage on the x-axis-deflection-plates) and vertically (same with the y-plates).
 
 ## Signals
 Conventionally the x-axis represents the time, meaning it will gradually move from the far left to the very right.
 The y-axis will be used to actually display the function we're interested in.
 
 ### Coordinates
 In order to make some sense of the dimensions our screen utilizes a coordinate system where both axes range from `-1` to `1`. A coordinate of (0 | 0) will be the very center, (-1 | -1) is in the bottom left corner and (1 | 1) in the top right.
 
 -----
 
 Our screen is prepopulated with a sine wave function, but both the x-function and the y-function can be customized.        
 They are represented as `Swift closures` that get passed values ranging from `-1` to `1` and are supposed to also return the result in the same range. (otherwise the point will not be visible on the screen)
 
 ## Examples
 Let's replicate some functions! Below the `xFunc` and `yFunc` are already filled out with a cosine wave displayed over time.
 
 - Try to make the display show a sine wave by changing the `yFunc` to using `sin` instead of `cos`
 
 */

let v = UIViewController()
let screen = Display(frame: CGRect(x: 40, y: 50, width: 300, height: 240))
v.view.addSubview(screen)

screen.xFunc = { x in return x }
screen.yFunc = { x in return cos(x * CGFloat.pi) * 0.6 }

PlaygroundPage.current.liveView = v

/*:
 
 Cool! Now try to make it a double-sine by uncommenting the following line and multiplying the `x` inside the `sin` by `2`.

 */

//screen.yFunc = { x in return sin(x * CGFloat.pi) * 0.6 }

/*:
 
 Looks amazing! Now we'll try changing the x-function. Uncomment the following line and try to make it `cos` of `x` multiplied by `0.6`.
 
 */

//screen.xFunc = { x in return x }

/*:

 Whoa! It's a circle!
 Congratulations! You now know how an oscilloscope works and what it can be used for. Go to the next page to have some fun exploring different shapes our oscilloscope can display:
 
 */

//: [Next](@next)
