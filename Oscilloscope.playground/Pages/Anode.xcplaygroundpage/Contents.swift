//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let v = UIViewController()
let anode = Anode(frame: CGRect(x: 50, y: 50, width: 150, height: 100))
v.view.addSubview(anode)

let p = UIBezierPath()
p.move(to: CGPoint(x: -50, y: anode.frame.height/2))
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
