//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let v = UIViewController()
let plate = Plate(frame: CGRect(x: 100, y: 100, width: 50, height: 50), mode: .y)

v.view.addSubview(plate)

let path = UIBezierPath()
path.move(to: CGPoint(x: 0, y: plate.frame.origin.y + plate.frame.height / 2))
path.addLine(to: CGPoint(x: plate.frame.origin.x, y: plate.frame.origin.y + plate.frame.height / 2))
path.addQuadCurve(to: CGPoint(x: plate.frame.origin.x + plate.frame.width, y: plate.frame.origin.y + plate.frame.height / 2 - 5), controlPoint: CGPoint(x: plate.frame.origin.x + plate.frame.width / 2, y: plate.frame.origin.y + plate.frame.height / 2))
path.addLine(to: CGPoint(x: 400, y: 50))

let layer = CAShapeLayer()
layer.path = path.cgPath
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
