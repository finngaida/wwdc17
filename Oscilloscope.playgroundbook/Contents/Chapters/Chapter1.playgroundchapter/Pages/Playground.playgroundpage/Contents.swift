
/*:
 ## Playground
 Now that you know all the details to our oscilloscope, I'll reveal some internal details to demystify your code:    
 
 #### The `Sideview`
 The view you saw on the [Table of Contents](Table of Contents) page basically just wraps all the components into one big view: `Cathode`, `Anode`, two `Plate`s and a `Screen` from left to right.
 
 #### The `Func`
 The `xFunc` and `yFunc` parameters of the `Display` don't actually take a `Func`, but rather a `((CGFloat) -> (CGFloat))` closure. The `Func` **enum** is just a convenience to get those closures more readable.      
 It looks like this:
 
 ```
 public enum Func {
    case progressive, sine, doubleSine, cosine, doubleCosine
 
    public func toFunc() -> ((CGFloat)->(CGFloat)) {
        switch self {
        case .progressive:
            return { input in
                return input
            }
        case .sine:
            return { input in
                return sin(input * CGFloat.pi)
            }
        case .doubleSine:
            return { input in
                return sin(input * 2 * CGFloat.pi)
            }
        case .cosine:
            return { input in
                return cos(input * CGFloat.pi)
            }
        case .doubleCosine:
            return { input in
                return cos(input * 2 * CGFloat.pi)
            }
        }
    }
 }
 ```
 
 > The closure gets values ranging **between `-1` and `1`** as an input and is asked to return values in that range as well. (These values represent the coordinates on the screen)
 
 -----
 What I'm getting to, is that you can also drop down to this layer of directly accessing the closure and thereby create more complex shapes.            
 
 I have prefilled a *double lissajous figure* already. Feel free to play around with some values and try to create some interesting shapes.
 
 As an inspiration, here are some ideas: **Circle**, **Oval**, **Triple lissajous figure**, **x² graph**, **√x graph *(hard)***, ...
 
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
//#-end-hidden-code

let display = Display()

//#-editable-code
display.xFunc = { i in return cos(i * CGFloat.pi) * 0.7 }
display.yFunc = { i in return sin(i * 3 * CGFloat.pi) * 0.6 }
//#-end-editable-code

//#-hidden-code
display.center = CGPoint(x: v.view.center.x/2, y: v.view.center.y)
v.display = display
v.view.addSubview(v.display!)
PlaygroundPage.current.liveView = v
//#-end-hidden-code

//: [⏮ Previous](@previous)
