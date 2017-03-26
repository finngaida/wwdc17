
import UIKit
import PlaygroundSupport
let v = UIViewController()

let cathode = Cathode(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
cathode.center = CGPoint(x: v.view.center.x/2, y: v.view.center.y)

v.view.addSubview(cathode)
PlaygroundPage.current.liveView = v
