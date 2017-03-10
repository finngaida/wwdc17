import UIKit

public class Display: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.243, green: 0.686, blue: 0.82, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        drawVerticalLines()
        drawHorizontalLines()
        drawSineWave()
        animateDot()
    }
    
    func animateDot() {
        let img = UIImage(named: "spark.png")
        let spark = UIImageView(image: img)
        spark.frame = CGRect(x: 0, y: self.frame.height / 2, width: 15, height: 15)
        self.addSubview(spark)
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = sinePath().cgPath
        anim.repeatCount = Float(Int.max)
        anim.duration = 2
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            spark.layer.add(anim, forKey: "")
        })
    }
    
    func drawVerticalLines() {
        let number:Int = Int(self.frame.width / 15)
        let p = UIBezierPath()
        
        for i in 1..<number {
            p.move(to: CGPoint(x: CGFloat(15*i), y: 0))
            p.addLine(to: CGPoint(x: CGFloat(15*i), y: self.frame.height))
        }
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor.black.cgColor
        l.lineWidth = 0.5
        self.layer.addSublayer(l)
    }
    
    func drawHorizontalLines() {
        let number:Int = Int(self.frame.height / 15)
        let p = UIBezierPath()
        
        for i in 1..<number {
            p.move(to: CGPoint(x: 0, y: CGFloat(15*i)))
            p.addLine(to: CGPoint(x: self.frame.width, y: CGFloat(15*i)))
        }
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor.black.cgColor
        l.lineWidth = 0.5
        self.layer.addSublayer(l)
    }
    
    func sinePath() -> UIBezierPath {
        let amplitude: CGFloat = 0.3
        let origin = CGPoint(x: 0, y: self.frame.height / 2)
        
        let path = UIBezierPath()
        path.move(to: origin)
        
        for angle in stride(from: 5.0, through: 360.0, by: 5.0) {
            let x = origin.x + CGFloat(angle/360.0) * self.frame.width
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * self.frame.height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
    
    func drawSineWave() {
        
        let l = CAShapeLayer()
        l.fillColor = nil
        l.path = sinePath().cgPath
        l.strokeColor = UIColor(red: 0.573, green: 1, blue: 0.996, alpha: 1).cgColor
        l.lineWidth = 2
        self.layer.addSublayer(l)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
