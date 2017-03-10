import UIKit

public class Anode: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


public class Sideview: UIView {
    
    var cathode: Cathode
    var focusAnode: Anode
    var accelerationAnode: Anode
    var xPlate: Plate
    var yPlate: Plate
    var screen: Screen
    
    override public init(frame: CGRect) {
        
        let w = frame.width
        let h = frame.height
        cathode = Cathode(frame: CGRect(x: w * 0.05, y: h * 0.5 - 15, width: 50, height: 30))
        focusAnode = Anode(frame: CGRect(x: cathode.frame.origin.x + cathode.frame.width + 10, y: h * 0.5 - 15, width: 30, height: 30))
        accelerationAnode = Anode(frame: CGRect(x: focusAnode.frame.origin.x + focusAnode.frame.width + 10, y: h * 0.5 - 15, width: 30, height: 30))
        xPlate = Plate(frame: CGRect(x: accelerationAnode.frame.origin.x + accelerationAnode.frame.width + 10, y: h * 0.5 - 15, width: 30, height: 30), mode: .x)
        yPlate = Plate(frame: CGRect(x: xPlate.frame.origin.x + xPlate.frame.width + 10, y: h * 0.5 - 15, width: 30, height: 30), mode: .y)
        screen = Screen(frame: CGRect(x: w - 5, y: 5, width: 5, height: h - 10))
        
        super.init(frame: frame)
        
        self.layer.addSublayer(borderLayer())
        [focusAnode, accelerationAnode, xPlate, yPlate, screen, cathode].forEach { self.addSubview($0) }
        let stream = streamLayer()
        self.layer.addSublayer(stream)
        
        let anim = CABasicAnimation(keyPath: "path")
        anim.fromValue = streamPath(false).cgPath
        anim.toValue = streamPath(true).cgPath
        anim.duration = 1
        anim.autoreverses = true
        anim.repeatCount = Float(Int.max)
        stream.add(anim, forKey: "")
    }
    
    func streamLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = streamPath(true).cgPath
        l.fillColor = nil
        l.strokeColor = UIColor.white.cgColor
        l.lineWidth = 4
        return l
    }
    
    func streamPath(_ up: Bool) -> UIBezierPath {
        let p1 = CGPoint(x: accelerationAnode.frame.origin.x, y: accelerationAnode.frame.origin.y + accelerationAnode.frame.height / 2)
        let p2 = CGPoint(x: yPlate.frame.origin.x, y: yPlate.frame.origin.y + yPlate.frame.height / 2)
        let p3 = CGPoint(x: yPlate.frame.origin.x + yPlate.frame.width, y: yPlate.frame.origin.y + yPlate.frame.height / 2 + (up ? -5 : 5))
        let p4 = CGPoint(x: screen.frame.origin.x + screen.frame.width, y: self.frame.height * (up ? 0.3 : 0.7))
        let p = UIBezierPath()
        p.move(to: p1)
        p.addLine(to: p2)
        p.addQuadCurve(to: p3, controlPoint: CGPoint(x: p2.x+(p3.x-p2.x)/2, y: p2.y))
        p.addLine(to: p4)
        return p
    }
    
    func borderLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = borderPath().cgPath
        l.fillColor = UIColor.darkGray.cgColor
        l.borderColor = UIColor.lightGray.cgColor
        l.lineJoin = kCALineJoinRound
        l.borderWidth = 3
        return l
    }
    
    func borderPath() -> UIBezierPath {
        let w = self.frame.width
        let h = self.frame.height
        
        let p1 = CGPoint(x: w * 0.0, y: h * 0.3)
        let p2 = CGPoint(x: w * 0.6, y: h * 0.3)
        let p3 = CGPoint(x: w * 1.0, y: h * 0.0)
        let p4 = CGPoint(x: w * 1.0, y: h * 1.0)
        let p5 = CGPoint(x: w * 0.6, y: h * 0.7)
        let p6 = CGPoint(x: w * 0.0, y: h * 0.7)
        
        let path = UIBezierPath()
        path.move(to: p1)
        [p2, p3, p4, p5, p6].forEach { path.addLine(to: $0) }
        return path
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
