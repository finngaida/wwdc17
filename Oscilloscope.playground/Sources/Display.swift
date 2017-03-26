import UIKit

public enum Func {
    case progressive, sine, doubleSine, cosine, doubleCosine
    
    public func toFunc() -> ((CGFloat)->(CGFloat)) {
        switch self {
        case .progressive:
            return { input in
                return input
            }
        case .sine:
            return { input in
                return sin(input * CGFloat.pi)
            }
        case .doubleSine:
            return { input in
                return sin(input * 2 * CGFloat.pi)
            }
        case .cosine:
            return { input in
                return cos(input * CGFloat.pi)
            }
        case .doubleCosine:
            return { input in
                return cos(input * 2 * CGFloat.pi)
            }
        }
    }
}

public class Display: UIView {
    
    public var xFunc: ((CGFloat)->(CGFloat)) {
        didSet {
            drawPath()
        }
    }
    
    public var yFunc: ((CGFloat)->(CGFloat)) {
        didSet {
            drawPath()
        }
    }
    
    public override var frame: CGRect {
        didSet {
            resetFrame()
        }
    }
    
    func resetFrame() {
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        drawVerticalLines()
        drawHorizontalLines()
        drawPath()
    }
    
    public init(frame: CGRect, xFunc: @escaping ((CGFloat)->(CGFloat)) = Func.progressive.toFunc(), yFunc: @escaping ((CGFloat)->(CGFloat)) = Func.sine.toFunc()) {
        self.xFunc = xFunc
        self.yFunc = yFunc
        self.dot = UIImageView(image: UIImage(named: "spark.png"))
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.243, green: 0.686, blue: 0.82, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(red: 0.894, green: 0.898, blue: 0.875, alpha: 1).cgColor
        self.layer.borderWidth = 3
        
        dot.frame = CGRect(x: 0, y: self.frame.height / 2, width: 15, height: 15)
        resetFrame()
    }
    
    var lineDistance: CGFloat = 30
    func drawVerticalLines() {
        let p = UIBezierPath()
        
        var x = self.frame.width / 2
        while x > 0 {
            x -= lineDistance
            p.move(to: CGPoint(x: x, y: 0))
            p.addLine(to: CGPoint(x: x, y: self.frame.height))
        }
        
        x = self.frame.width / 2
        while x < self.frame.width {
            x += lineDistance
            p.move(to: CGPoint(x: x, y: 0))
            p.addLine(to: CGPoint(x: x, y: self.frame.height))
        }
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor(white: 0, alpha: 0.8).cgColor
        l.lineWidth = 0.5
        self.layer.addSublayer(l)
        
        self.drawVerticalCenterLine()
        self.setupVerticalLettering()
    }
    
    func drawVerticalCenterLine() {
        let p = UIBezierPath()
            p.move(to: CGPoint(x: self.frame.width/2, y: 0))
            p.addLine(to: CGPoint(x: self.frame.width/2, y: self.frame.height))
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor.black.cgColor
        l.lineWidth = 1
        l.lineDashPattern = [5]
        self.layer.addSublayer(l)
    }
    
    func setupVerticalLettering() {
        ["-1", "0", "1"].enumerated().forEach { (i, s) in
            let x:CGFloat = self.frame.width * (i==0 ? 0.01 : i==2 ? 0.97 : 0.49)
            let label = UILabel(frame: CGRect(x: x, y: self.frame.height/2-10, width: 20, height: 20))
            label.textColor = UIColor(red: 0.573, green: 1, blue: 0.996, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = s
            self.addSubview(label)
        }
    }
    
    func drawHorizontalLines() {
        let p = UIBezierPath()
        
        var y = self.frame.height / 2
        while y > 0 {
            y -= lineDistance
            p.move(to: CGPoint(x: 0, y: y))
            p.addLine(to: CGPoint(x: self.frame.width, y: y))
        }
        
        y = self.frame.height / 2
        while y < self.frame.height {
            y += lineDistance
            p.move(to: CGPoint(x: 0, y: y))
            p.addLine(to: CGPoint(x: self.frame.width, y: y))
        }
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor(white: 0, alpha: 0.8).cgColor
        l.lineWidth = 0.5
        self.layer.addSublayer(l)
        
        self.drawHorizontalCenterLine()
        self.setupHorizontalLettering()
    }
    
    func setupHorizontalLettering() {
        ["1", "-1"].enumerated().forEach { (i, s) in
            let y:CGFloat = self.frame.height * (i==0 ? 0.01 : 0.92)
            let label = UILabel(frame: CGRect(x: self.frame.width/2-10, y: y, width: 20, height: 20))
            label.textColor = UIColor(red: 0.573, green: 1, blue: 0.996, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = s
            self.addSubview(label)
        }
    }
    
    func drawHorizontalCenterLine() {
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0, y: self.frame.height/2))
        p.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height/2))
        
        let l = CAShapeLayer()
        l.path = p.cgPath
        l.strokeColor = UIColor.black.cgColor
        l.lineWidth = 1
        l.lineDashPattern = [5]
        self.layer.addSublayer(l)
    }
    
    public var amplitude: CGFloat = 1 {
        didSet {
            drawPath()
        }
    }
    
    func path() -> UIBezierPath {
        let path = UIBezierPath()
        let minwh = self.frame.width
        
        for perWidth in Int(0)..<Int(minwh) {               // 0 ... minwh
            let per1 = CGFloat(perWidth) / minwh            // 0 ... 1
            let n1to1 = per1 * 2 - 1                        // -1 ... 1
            let x = ((xFunc(n1to1) + 1) / 2) * minwh
            let y = (1-((yFunc(n1to1) * amplitude + 1) / 2)) * minwh + ((self.frame.height-minwh)/2)
            if perWidth == 0 { path.move(to: CGPoint(x: x, y: y)) }
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
    
    var pathLayer: CAShapeLayer?
    
    func drawPath() {
        
        if let l = pathLayer {
            l.removeFromSuperlayer()
        }
        
        let l = CAShapeLayer()
        l.fillColor = nil
        l.path = path().cgPath
        l.strokeColor = UIColor(red: 0.573, green: 1, blue: 0.996, alpha: 1).cgColor
        l.lineWidth = 2
        self.layer.addSublayer(l)
        pathLayer = l
        
        animateDot()
    }
    
    var dot: UIImageView
    
    func animateDot() {
        
        if dot.superview == nil {
            self.addSubview(dot)
        }
        
        dot.layer.removeAllAnimations()
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path().cgPath
        anim.repeatCount = Float(Int.max)
        anim.duration = 1
        dot.layer.add(anim, forKey: "")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
