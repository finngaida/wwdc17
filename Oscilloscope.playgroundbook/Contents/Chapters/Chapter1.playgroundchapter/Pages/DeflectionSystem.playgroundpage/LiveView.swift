
import UIKit
import PlaygroundSupport

public class CenterViewController: UIViewController {
    
    public var plate: Plate?
    public var shape: CAShapeLayer?
    
    public override func viewDidLayoutSubviews() {
        if let p = plate {
            p.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        }
        if let s = shape {
            s.path = Plate.createPath(with: CGPoint(x: 0, y: self.view.center.y), distanceToYPlates: self.plate!.frame.origin.x, lengthOfYPlates: self.plate!.frame.width, yAcceleration: -30, distanceToScreen: self.view.frame.width-self.plate!.frame.origin.x-self.plate!.frame.width).cgPath
        }
    }
}

let v = CenterViewController()

let x:CGFloat = 150
let ym:CGFloat = v.view.center.y

let plate = Plate(frame: CGRect(x: x, y: ym-50, width: x, height: x), mode: .y, withSigns: true)
v.plate = plate
v.view.addSubview(v.plate!)

let layer = CAShapeLayer()
layer.strokeColor = UIColor.white.cgColor
layer.lineWidth = 3
layer.fillColor = nil
v.shape = layer
v.view.layer.addSublayer(v.shape!)

let anim = CABasicAnimation(keyPath: "strokeEnd")
anim.fromValue = 0
anim.toValue = 1
anim.duration = 3
anim.repeatCount = Float(Int.max)
v.shape!.add(anim, forKey: "")

PlaygroundPage.current.liveView = v
