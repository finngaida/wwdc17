import UIKit

public class Cathode: UIView {
    
    var emitter: CAEmitterLayer
    
    override public init(frame: CGRect) {
        emitter = CAEmitterLayer()
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        
        emitter.emitterPosition = CGPoint(x: frame.width/4, y: frame.height/2)
        
        let cell = CAEmitterCell()
        cell.birthRate = 100
        cell.lifetime = 1
        cell.velocity = 100
        cell.scale = 0.1
        cell.emissionLongitude = CGFloat.pi * 0
        cell.emissionRange = -CGFloat.pi * 0.25
        cell.contents = UIImage(named: "spark.png")!.cgImage
        
        emitter.frame = CGRect(x: 0, y: 0, width: frame.width*2, height: frame.height)
        emitter.masksToBounds = true
        emitter.emitterCells = [cell]
        
        self.layer.addSublayer(spiralLayer())
        self.layer.addSublayer(emitter)
    }
    
    func spiralLayer() -> CALayer {
        let l = CAShapeLayer()
        l.path = spiralPath().cgPath
        l.fillColor = nil
        l.strokeColor = UIColor.white.cgColor
        l.lineWidth = 3
        l.position = CGPoint(x: 40*self.frame.width/100, y: 20*self.frame.height/100)
        l.transform = CATransform3DMakeRotation(CGFloat.pi * 0.5, 0, 0, 1)
        l.transform = CATransform3DScale(l.transform, self.frame.width/100, self.frame.height/100, 1)
        return l
    }
    
    func spiralPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 1, y: 50))
        path.addLine(to: CGPoint(x: 1, y: 27.52))
        path.addCurve(to: CGPoint(x: 19.82, y: 13.19), controlPoint1: CGPoint(x: 1.82, y: 27.52), controlPoint2: CGPoint(x: 19.82, y: 23.51))
        path.addCurve(to: CGPoint(x: 8.3, y: 0), controlPoint1: CGPoint(x: 19.82, y: 2.87), controlPoint2: CGPoint(x: 8.3, y: 0))
        path.addCurve(to: CGPoint(x: 1.82, y: 13.19), controlPoint1: CGPoint(x: 8.3, y: 0), controlPoint2: CGPoint(x: -4.67, y: 3.44))
        path.addCurve(to: CGPoint(x: 14.78, y: 27.52), controlPoint1: CGPoint(x: 8.3, y: 22.93), controlPoint2: CGPoint(x: 14.78, y: 27.52))
        path.move(to: CGPoint(x: 14.06, y: 27.52))
        path.addCurve(to: CGPoint(x: 32.07, y: 13.19), controlPoint1: CGPoint(x: 14.06, y: 27.52), controlPoint2: CGPoint(x: 32.07, y: 23.51))
        path.addCurve(to: CGPoint(x: 20.54, y: 0), controlPoint1: CGPoint(x: 32.07, y: 2.87), controlPoint2: CGPoint(x: 20.54, y: 0))
        path.addCurve(to: CGPoint(x: 14.06, y: 13.19), controlPoint1: CGPoint(x: 20.54, y: 0), controlPoint2: CGPoint(x: 7.58, y: 3.44))
        path.addCurve(to: CGPoint(x: 27.03, y: 27.52), controlPoint1: CGPoint(x: 20.54, y: 22.93), controlPoint2: CGPoint(x: 27.03, y: 27.52))
        path.move(to: CGPoint(x: 27.03, y: 27.52))
        path.addCurve(to: CGPoint(x: 45.03, y: 13.19), controlPoint1: CGPoint(x: 27.03, y: 27.52), controlPoint2: CGPoint(x: 45.03, y: 23.51))
        path.addCurve(to: CGPoint(x: 33.51, y: 0), controlPoint1: CGPoint(x: 45.03, y: 2.87), controlPoint2: CGPoint(x: 33.51, y: 0))
        path.addCurve(to: CGPoint(x: 27.03, y: 13.19), controlPoint1: CGPoint(x: 33.51, y: 0), controlPoint2: CGPoint(x: 20.54, y: 3.44))
        path.addCurve(to: CGPoint(x: 39.99, y: 27.52), controlPoint1: CGPoint(x: 33.51, y: 22.93), controlPoint2: CGPoint(x: 39.99, y: 27.52))
        path.move(to: CGPoint(x: 39.99, y: 27.52))
        path.addCurve(to: CGPoint(x: 58, y: 13.19), controlPoint1: CGPoint(x: 39.99, y: 27.52), controlPoint2: CGPoint(x: 58, y: 23.51))
        path.addCurve(to: CGPoint(x: 46.47, y: 0), controlPoint1: CGPoint(x: 58, y: 2.87), controlPoint2: CGPoint(x: 46.47, y: 0))
        path.addCurve(to: CGPoint(x: 39.99, y: 13.19), controlPoint1: CGPoint(x: 46.47, y: 0), controlPoint2: CGPoint(x: 33.51, y: 3.44))
        path.addCurve(to: CGPoint(x: 52.96, y: 27.52), controlPoint1: CGPoint(x: 46.47, y: 22.93), controlPoint2: CGPoint(x: 52.96, y: 27.52))
        path.addLine(to: CGPoint(x: 53, y: 50))
        return path
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
