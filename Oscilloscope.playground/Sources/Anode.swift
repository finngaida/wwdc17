import UIKit

public class Anode: UIView {
    
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initLayers()
    }
    
    public var backLayer: CALayer?
    public var circleLayer: CALayer?
    public var topLayer: CALayer?
    
    func initLayers() {
        let i: CGFloat = self.frame.width * 0.3
        let w: CGFloat = self.frame.width
        let h: CGFloat = self.frame.height
        
        let back = UIBezierPath()
        back.move(to: CGPoint(x: w-i, y: 0))
        back.addQuadCurve(to: CGPoint(x: w-i, y: h), controlPoint: CGPoint(x: w, y: h/2))
        back.addQuadCurve(to: CGPoint(x: w-i, y: 0), controlPoint: CGPoint(x: w-i*2, y: h/2))
        
        let l1 = CAShapeLayer()
        l1.path = back.cgPath
        l1.fillColor = UIColor.lightGray.cgColor
        l1.strokeColor = UIColor.darkGray.cgColor
        l1.lineWidth = 2
        l1.lineJoin = kCALineJoinRound
        backLayer = l1
        self.layer.addSublayer(l1)
        
        let circle = UIBezierPath()
        circle.move(to: CGPoint(x: w-i, y: 2))
        circle.addLine(to: CGPoint(x: w-i, y: h/2-i/4))
        circle.addQuadCurve(to: CGPoint(x: w-i, y: h/2+i/4), controlPoint: CGPoint(x: w-i*1.125, y: h/2))
        circle.addLine(to: CGPoint(x: w-i, y: h-2))
        circle.addQuadCurve(to: CGPoint(x: w-i, y: 2), controlPoint: CGPoint(x: w-i*2+1, y: h/2))
        
        let lc = CAShapeLayer()
        lc.path = circle.cgPath
        lc.fillColor = UIColor.lightGray.cgColor
        lc.lineWidth = 0
        circleLayer = lc
        self.layer.addSublayer(lc)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: i, y: 0))
        path.addLine(to: CGPoint(x: w-i, y: 0))
        path.addQuadCurve(to: CGPoint(x: w-i, y: h), controlPoint: CGPoint(x: w-i*2, y: h/2))
        path.addLine(to: CGPoint(x: i, y: h))
        path.addQuadCurve(to: CGPoint(x: i, y: 0), controlPoint: CGPoint(x: 0, y: h/2))
        
        let l2 = CAShapeLayer()
        l2.path = path.cgPath
        l2.fillColor = UIColor.lightGray.cgColor
        l2.strokeColor = UIColor.darkGray.cgColor
        l2.lineWidth = 2
        l2.lineJoin = kCALineJoinRound
        topLayer = l2
        self.layer.addSublayer(l2)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
