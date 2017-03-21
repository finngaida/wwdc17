//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/*:
 Right now the screen only shows a bright dot in the middle, that's not exactly what we're looking for, it should be moving.    
 How do you go about moving an electrode beam you might ask?    
 
 ## Deflection system
 We're going to make use of the fact, that electrons are negatively charged once more. Just like the [anode](Anode) creates an electrical field, thus accelerating the electrons, we can create a seperate electrical field accelerating the electrons vertically or horizontally.      
 To create such a field all we need are two *plates* with a specific voltage applied to them.   
 
 Now these x- and y-voltages describe how far the electrons will be deflected and don't at all have to be static, quite the contrary: they are almost always alternating.
 
 More on these alternations in the [next chapter](@next).
 
 -----
 
 In our oscilloscope we can use the `Plate` class to represent such a deflection system:
 
 */

let v = UIViewController()

let x:CGFloat = 100
let ym:CGFloat = 125

let plate = Plate(frame: CGRect(x: x, y: ym-50, width: x, height: x), mode: .y)

v.view.addSubview(plate)

let layer = CAShapeLayer()
layer.path = Plate.createPath(with: CGPoint(x: 0, y: ym), distanceToYPlates: x, lengthOfYPlates: x, yAcceleration: -20, distanceToScreen: 200).cgPath
layer.strokeColor = UIColor.white.cgColor
layer.lineWidth = 3
layer.fillColor = nil

v.view.layer.addSublayer(layer)

let anim = CABasicAnimation(keyPath: "strokeEnd")
anim.fromValue = 0
anim.toValue = 1
anim.duration = 5
anim.repeatCount = Float(Int.max)
layer.add(anim, forKey: "")

PlaygroundPage.current.liveView = v

//: [Next](@next)