//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/*:
 Okay so we have the electrons flying around *somewhere*, but we need them to form an **electron beam**, to actually create a bright spot on the screen.
 
## Anode 
 As the electrons are negatively charged, how about we put a positively charged ***anode*** in front of the cathode?    
 This will attract the electrons and thereby accelerate them to the desired speed.      
 If we just put a hole in the middle of the anode we can also absorb all those electrons that don't go in the right direction and so we get our electron beam.
 
 -----
 
 Again there already is a class called `Anode` that we can use for our oscilloscope. Check it out by running this code:
 
 */

let v = UIViewController()

let cathode = Cathode(frame: CGRect(x: 0, y: 62, width: 75, height: 75))
v.view.addSubview(cathode)

let anode = Anode(frame: CGRect(x: 50, y: 50, width: 150, height: 100))
v.view.addSubview(anode)

let p = UIBezierPath()
p.move(to: CGPoint(x: -20, y: anode.frame.height/2))
p.addLine(to: CGPoint(x: 300, y: anode.frame.height/2))

let l = CAShapeLayer()
l.path = p.cgPath
l.strokeColor = UIColor.white.cgColor
l.lineWidth = 2
anode.layer.insertSublayer(l, above: anode.backLayer!)

let anim = CABasicAnimation(keyPath: "strokeEnd")
anim.fromValue = 0
anim.toValue
anim.duration = 2
anim.repeatCount = Float(Int.max)
l.add(anim, forKey: "")

PlaygroundPage.current.liveView = v

//: [Next](@next)
