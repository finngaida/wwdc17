
import UIKit
import PlaygroundSupport

let v = UIViewController()
let x:CGFloat = 100
let ym:CGFloat = v.view.frame.height/2

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
