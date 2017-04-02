import UIKit

public class PlateViewController: UIViewController {
    
    public var plate: Plate!
    var beam: CAShapeLayer?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let x:CGFloat = 100
        let ym:CGFloat = 125
        
        let plate = Plate(frame: CGRect(x: x, y: ym-50, width: x, height: x), mode: .y)
        self.view.addSubview(plate)
    }
    
    public override func viewDidLayoutSubviews() {
        let x:CGFloat = 100
        let ym:CGFloat = 125
        
        plate.frame = CGRect(x: x, y: ym-50, width: x, height: x)
        
        if let l = beam {
            l.removeAllAnimations()
            l.removeFromSuperlayer()
            beam = nil
        }
        
        beam = CAShapeLayer()
        beam!.path = Plate.createPath(with: CGPoint(x: 0, y: ym), distanceToYPlates: x, lengthOfYPlates: x, yAcceleration: -20, distanceToScreen: 200).cgPath
        beam!.strokeColor = UIColor.white.cgColor
        beam!.lineWidth = 3
        beam!.fillColor = nil
        
        self.view.layer.addSublayer(beam!)
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 5
        anim.repeatCount = Float(Int.max)
        beam!.add(anim, forKey: "")
    }
    
}
