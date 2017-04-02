import UIKit

public class AnodeViewController: UIViewController {
    
    public var cathode: Cathode!
    public var anode: Anode!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        cathode = Cathode(frame: CGRect(x: 20, y: 62, width: 75, height: 75))
        self.view.addSubview(cathode)
        
        anode = Anode(frame: CGRect(x: 80, y: 50, width: 150, height: 100))
        self.view.addSubview(anode)
        
        let p = UIBezierPath()
        p.move(to: CGPoint(x: -20, y: anode.frame.height/2))
        p.addLine(to: CGPoint(x: self.view.center.x, y: anode.frame.height/2))
        
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
    }
    
    public override func viewDidLayoutSubviews() {
        cathode.center = CGPoint(x: cathode.center.x, y: self.view.center.y)
        anode.center = CGPoint(x: anode.center.x, y: self.view.center.y)
    }
    
}
