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
 You can press run ▶️ and see what it looks like!
 
 > Try to make the display show a sine wave by changing the `yFunc` to using `sine` instead of `cosine`
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

public class CenterViewController: UIViewController {
    
    public var display: Display?
    
    public override func viewDidLayoutSubviews() {
        if let d = display {
            d.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        }
    }
}

let v = CenterViewController()

func progressive() -> ((CGFloat)->(CGFloat)) { return Func.progressive.toFunc() }
func sine() -> ((CGFloat)->(CGFloat)) { return Func.sine.toFunc() }
func doubleSine() -> ((CGFloat)->(CGFloat)) { return Func.doubleSine.toFunc() }
func cosine() -> ((CGFloat)->(CGFloat)) { return Func.cosine.toFunc() }
func doubleCosine() -> ((CGFloat)->(CGFloat)) { return Func.doubleCosine.toFunc() }
//#-end-hidden-code

let display = Display()

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, progressive(), sine(), doubleSine(), cosine(), doubleCosine())
display.xFunc = /*#-editable-code*/progressive()/*#-end-editable-code*/
display.yFunc = /*#-editable-code*/cosine()/*#-end-editable-code*/

//#-hidden-code
display.center = CGPoint(x: v.view.center.x/2, y: v.view.center.y)
display.amplitude = 0.6
v.display = display
v.view.addSubview(v.display!)
PlaygroundPage.current.liveView = v
//#-end-hidden-code

/*:
 
 Cool! Now try to make it a double-sine by uncommenting the following line and using `doubleSine()`.
 
 */

//#-editable-code
//display.yFunc = <#cosine()#>
//#-end-editable-code

/*:
 
 Looks amazing! Now we'll try changing the x-function. Uncomment the following line and try to make it `sine`.
 
 */

//#-editable-code
//display.xFunc = <#sine()#>
//#-end-editable-code

//#-hidden-code
if display.xFunc(0.5) == sine()(0.5) && display.yFunc(0.5) == doubleSine()(0.5) {
    PlaygroundPage.current.assessmentStatus = .pass(message: "**Whoa!** It's a [Lissajous figure](https://en.wikipedia.org/wiki/Lissajous_curve)!\nCongratulations! You now know how an oscilloscope works and what it can be used for. Go to the [next page](@next) to have some fun exploring different shapes our oscilloscope can display.")
}
//#-end-hidden-code

//: [⏮ Previous](@previous) | [Next ⏭](@next)
