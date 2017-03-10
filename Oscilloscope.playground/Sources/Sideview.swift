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
    
    override init(frame: CGRect) {
        
        cathode = Cathode(frame: CGRect(x: 10, y: 135, width: 50, height: 30))
        focusAnode = Anode(frame: CGRect(x: 70, y: 135, width: 30, height: 30))
        accelerationAnode = Anode(frame: CGRect(x: 110, y: 135, width: 30, height: 30))
        xPlate = Plate(frame: CGRect(x: 150, y: 135, width: 30, height: 30), mode: .x)
        yPlate = Plate(frame: CGRect(x: 190, y: 135, width: 30, height: 30), mode: .y)
        screen = Screen(frame: CGRect(x: 370, y: 30, width: 10, height: 240))
        
        super.init(frame: frame)
        
        self.layer.addSublayer(borderLayer())
        [focusAnode, accelerationAnode, xPlate, yPlate, screen, cathode].forEach { self.addSubview($0) }
        let stream = streamLayer()
        self.layer.addSublayer(stream)
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 5
        stream.add(anim, forKey: "")
    }
    
    func streamLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = streamPath().cgPath
        l.fillColor = nil
        l.strokeColor = UIColor.white.cgColor
        l.lineWidth = 4
        return l
    }
    
    func streamPath() -> UIBezierPath {
        let p1 = CGPoint(x: 110, y: 150)
        let p2 = CGPoint(x: 190, y: 150)
        let p3 = CGPoint(x: 220, y: 145)
        let p4 = CGPoint(x: 380, y: 100)
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
        l.borderColor = UIColor.black.cgColor
        l.borderWidth = 3
        return l
    }
    
    func borderPath() -> UIBezierPath {
        let p1 = CGPoint(x: 0, y: 100)
        let p2 = CGPoint(x: 300, y: 100)
        let p3 = CGPoint(x: 400, y: 0)
        let p4 = CGPoint(x: 400, y: 300)
        let p5 = CGPoint(x: 300, y: 200)
        let p6 = CGPoint(x: 0, y: 200)
        
        let path = UIBezierPath()
        path.move(to: p1)
        [p2, p3, p4, p5, p6].forEach { path.addLine(to: $0) }
        return path
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
