//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let v = UIViewController()
let plate = Plate(frame: CGRect(x: 100, y: 75, width: 100, height: 100), mode: .y)

v.view.addSubview(plate)

let ym: CGFloat = plate.frame.origin.y + plate.frame.height / 2
let xr: CGFloat = plate.frame.origin.x + plate.frame.width
let a: CGFloat = -30   // E-Feld Beschl
let t: CGFloat = 1      // Zeit im Feld (Steigung danach)
let s = 0.5 * a * pow(t, 2)     // Ablenkung am Ende des Feldes
let d: CGFloat = 200    // Feld - Schirm
let fs = ym + s + (d * t * a/100)   // Ablenkung auf dem Schirm

let path = UIBezierPath()
path.move(to: CGPoint(x: 0, y: ym))
path.addLine(to: CGPoint(x: plate.frame.origin.x, y: ym))
path.addQuadCurve(to: CGPoint(x: xr, y: ym + s), controlPoint: CGPoint(x: plate.frame.origin.x + plate.frame.width / 2, y: ym))
path.addLine(to: CGPoint(x: xr + d, y: fs))

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
