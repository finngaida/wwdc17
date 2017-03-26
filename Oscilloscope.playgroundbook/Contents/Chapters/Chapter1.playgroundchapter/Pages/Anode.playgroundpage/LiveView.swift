
import UIKit
import PlaygroundSupport

let v = UIViewController()

let cathode = Cathode(frame: CGRect(x: 30, y: 162, width: 100, height: 100))
cathode.center = CGPoint(x: cathode.center.x, y: v.view.center.y)
let anode = Anode(frame: CGRect(x: 100, y: 160, width: 150, height: 100))
anode.center = CGPoint(x: anode.center.x, y: v.view.center.y)

v.view.addSubview(cathode)
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
anim.toValue = 1
anim.duration = 2
anim.repeatCount = Float(Int.max)
l.add(anim, forKey: "")

PlaygroundPage.current.liveView = v
