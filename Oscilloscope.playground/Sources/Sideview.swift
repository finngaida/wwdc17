import UIKit

public class Sideview: UIView {
    
    var cathode: Cathode
    var anode: Anode
    var xPlate: Plate
    var yPlate: Plate
    var screen: Screen
    
    override public var frame: CGRect {
        didSet {
            self.subviews.forEach { $0.removeFromSuperview() }
            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            
            let w = frame.width
            let h = frame.height
            cathode = Cathode(frame: CGRect(x: 8, y: h * 0.5 - 15, width: 15, height: 30))
            anode = Anode(frame: CGRect(x: cathode.frame.origin.x + cathode.frame.width, y: h * 0.5 - 15, width: 55, height: 30))
            xPlate = Plate(frame: CGRect(x: anode.frame.origin.x + anode.frame.width, y: h * 0.5 - 40, width: 70, height: 80), mode: .x)
            yPlate = Plate(frame: CGRect(x: xPlate.frame.origin.x + xPlate.frame.width, y: h * 0.5 - 40, width: 70, height: 80), mode: .y)
            screen = Screen(frame: CGRect(x: w - 1, y: 0, width: 3, height: h))
            
            commonInit()
        }
    }
    
    func commonInit() {
        self.layer.addSublayer(borderLayer())
        [anode, xPlate, yPlate, screen, cathode].forEach { self.addSubview($0) }
        let stream = streamLayer()
        self.layer.addSublayer(stream)
        
        anode.topLayer?.removeFromSuperlayer()
        anode.topLayer?.position = CGPoint(x: anode.frame.origin.x, y: anode.frame.origin.y)
        self.layer.addSublayer(anode.topLayer!)
        
        anode.circleLayer?.removeFromSuperlayer()
        anode.circleLayer?.position = CGPoint(x: anode.frame.origin.x, y: anode.frame.origin.y)
        self.layer.addSublayer(anode.circleLayer!)
        
        xPlate.plate2?.removeFromSuperlayer()
        xPlate.plate2?.position = CGPoint(x: xPlate.frame.origin.x, y: xPlate.frame.origin.y)
        self.layer.addSublayer(xPlate.plate2!)
        
        let anim = CABasicAnimation(keyPath: "path")
        anim.fromValue = streamPath(false).cgPath
        anim.toValue = streamPath(true).cgPath
        anim.duration = 1
        anim.autoreverses = true
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anim.repeatCount = Float(Int.max)
        stream.add(anim, forKey: "")
        
        addLabels()
    }
    
    override public init(frame: CGRect) {
        
        let w = frame.width
        let h = frame.height
        cathode = Cathode(frame: CGRect(x: 8, y: h * 0.5 - 15, width: 15, height: 30))
        anode = Anode(frame: CGRect(x: cathode.frame.origin.x + cathode.frame.width, y: h * 0.5 - 15, width: 55, height: 30))
        xPlate = Plate(frame: CGRect(x: anode.frame.origin.x + anode.frame.width, y: h * 0.5 - 40, width: 70, height: 80), mode: .x)
        yPlate = Plate(frame: CGRect(x: xPlate.frame.origin.x + xPlate.frame.width, y: h * 0.5 - 40, width: 70, height: 80), mode: .y)
        screen = Screen(frame: CGRect(x: w - 1, y: 0, width: 3, height: h))
        
        super.init(frame: frame)
        
        commonInit()
    }
    
    func addLabels() {
        
        let w = self.frame.width
        let h = self.frame.height
        
        func l() -> UILabel {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }
        
        let cat = l()
        cat.frame = CGRect(x: -w/13, y: h-30, width: 100, height: 30)
        cat.text = "Cathode"
        
        let ano = l()
        ano.frame = CGRect(x: w/12, y: h-30, width: 100, height: 30)
        ano.text = "Anode"
        
        let def = l()
        def.frame = CGRect(x: w/5, y: h-30, width: 200, height: 30)
        def.text = "Deflection System"
        
        let scr = l()
        scr.frame = CGRect(x: w*0.6, y: h-30, width: 100, height: 30)
        scr.text = "Screen"
        
        [cat, ano, def, scr].forEach { self.addSubview($0) }
        
        let paths = UIBezierPath()
        paths.move(to: CGPoint(x: cathode.center.x, y: cathode.center.y + 20))
        paths.addLine(to: CGPoint(x: cat.center.x, y: cat.center.y - 20))
        
        paths.move(to: CGPoint(x: anode.center.x, y: anode.center.y + 20))
        paths.addLine(to: CGPoint(x: ano.center.x, y: ano.center.y - 20))
        
        paths.move(to: CGPoint(x: xPlate.center.x-10, y: xPlate.center.y + 20))
        paths.addLine(to: CGPoint(x: def.center.x, y: def.center.y - 20))
        
        paths.move(to: CGPoint(x: yPlate.center.x, y: yPlate.center.y + 40))
        paths.addLine(to: CGPoint(x: def.center.x, y: def.center.y - 20))
        
        paths.move(to: CGPoint(x: screen.center.x, y: screen.center.y + 20))
        paths.addLine(to: CGPoint(x: scr.center.x, y: scr.center.y - 20))
        
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.borderWidth = 2
        layer.fillColor = nil
        layer.path = paths.cgPath
        self.layer.addSublayer(layer)
    }
    
    func streamLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = streamPath(true).cgPath
        l.fillColor = nil
        l.strokeColor = UIColor.white.cgColor
        l.lineWidth = 2
        return l
    }
    
    func streamPath(_ up: Bool) -> UIBezierPath {
        let ym: CGFloat = yPlate.frame.origin.y + yPlate.frame.height / 2
        let ax: CGFloat = anode.frame.origin.x
        let x: CGFloat = yPlate.frame.origin.x
        let xw: CGFloat = yPlate.frame.width
        let start = CGPoint(x: ax, y: ym)
        return Plate.createPath(with: start, distanceToYPlates: x - ax, lengthOfYPlates: xw, yAcceleration: up ? -20 : 20, distanceToScreen: screen.frame.origin.x-x-xw)
    }
    
    func borderLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = borderPath().cgPath
        l.fillColor = UIColor(white: 0, alpha: 0.9).cgColor
        l.strokeColor = UIColor.lightGray.cgColor
        l.lineJoin = kCALineJoinRound
        l.lineWidth = 3
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
        [p2, p3, p4, p5, p6, p1].forEach { path.addLine(to: $0) }
        return path
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
