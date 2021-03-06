import UIKit

public class Plate: UIView {
    
    public enum Mode {
        case x, y
    }
    
    var mode: Mode
    
    public var plate1: CALayer?
    public var plate2: CALayer?
    var withSigns: Bool
    
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100), mode: .y, withSigns: true)
    }
    
    public init(frame: CGRect, mode: Mode, withSigns: Bool = false) {
        self.mode = mode
        self.withSigns = withSigns
        super.init(frame: frame)

        switch mode {
        case .x: setupXPlates()
        case .y: setupYPlates()
        }
    }
    
    public class func createPath(with startPoint: CGPoint, distanceToYPlates: CGFloat, lengthOfYPlates: CGFloat, yAcceleration: CGFloat, distanceToScreen: CGFloat) -> UIBezierPath {
        
        let ym: CGFloat = startPoint.y
        let xr: CGFloat = startPoint.x + distanceToYPlates + lengthOfYPlates
        let a: CGFloat = yAcceleration
        let d: CGFloat = distanceToScreen
        let fs = ym + a + (d * a/lengthOfYPlates)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: startPoint.x + distanceToYPlates, y: ym))
        path.addQuadCurve(to: CGPoint(x: xr, y: ym + a/2), controlPoint: CGPoint(x: startPoint.x + distanceToYPlates + lengthOfYPlates / 2, y: ym))
        path.addLine(to: CGPoint(x: xr + d, y: fs))
        
        return path
    }
    
    let plateHeight: CGFloat = 15
    func setupXPlates() {
        
        let pb = UIBezierPath()
        pb.move(to: CGPoint(x: self.frame.width/3, y: 0))
        pb.addLine(to: CGPoint(x: self.frame.width, y: 0))
        pb.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height*2/3))
        pb.addLine(to: CGPoint(x: self.frame.width/3, y: self.frame.height*2/3))
        pb.addLine(to: CGPoint(x: self.frame.width/3, y: 0))
        
        let lb = CAShapeLayer()
        lb.path = pb.cgPath
        lb.fillColor = UIColor.lightGray.cgColor
        lb.strokeColor = UIColor.darkGray.cgColor
        lb.lineWidth = 2
        lb.lineJoin = kCALineJoinBevel
        plate1 = lb
        self.layer.addSublayer(lb)
        
        let pf = UIBezierPath()
        pf.move(to: CGPoint(x: 0, y: self.frame.height))
        pf.addLine(to: CGPoint(x: 0, y: self.frame.height/3))
        pf.addLine(to: CGPoint(x: self.frame.width*2/3, y: self.frame.height/3))
        pf.addLine(to: CGPoint(x: self.frame.width*2/3, y: self.frame.height))
        pf.addLine(to: CGPoint(x: 0, y: self.frame.height))
        
        let lf = CAShapeLayer()
        lf.path = pf.cgPath
        lf.fillColor = UIColor.lightGray.cgColor
        lf.strokeColor = UIColor.darkGray.cgColor
        lf.lineWidth = 2
        lf.lineJoin = kCALineJoinBevel
        plate2 = lf
        self.layer.addSublayer(lf)
        
        setupHorizontalLines()
    }
    
    func setupHorizontalLines() {
        let w = self.frame.width
        let h = self.frame.height
        let numberOfLines: Int = Int(w) / Int(plateHeight)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 2, y: h/3))
        
        for i in 1..<numberOfLines {
            path.addLine(to: CGPoint(x: w / CGFloat(numberOfLines+1) * CGFloat(i) + 10, y: 2))
            path.move(to: CGPoint(x: w / CGFloat(numberOfLines+1) * CGFloat(i) + 2, y: h/3))
        }
        
        path.move(to: CGPoint(x: w*2/3, y: h/3))
        
        for i in 0..<numberOfLines {
            path.addLine(to: CGPoint(x: w - 2, y: h / CGFloat(numberOfLines+1) * CGFloat(i) + 2))
            path.move(to: CGPoint(x: w*2/3, y: h / CGFloat(numberOfLines+1) * CGFloat(i+2) + 12))
        }
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor(white: 1, alpha: 1).cgColor
        layer.lineWidth = 1
        layer.lineDashPattern = [4]
        self.layer.addSublayer(layer)
    }
    
    func setupYPlates() {
        let pt = UIBezierPath()
        pt.move(to: CGPoint(x: 0, y: plateHeight))
        pt.addLine(to: CGPoint(x: plateHeight*2, y: 0))
        pt.addLine(to: CGPoint(x: self.frame.width, y: 0))
        pt.addLine(to: CGPoint(x: self.frame.width-plateHeight*2, y: plateHeight))
        pt.addLine(to: CGPoint(x: 0, y: plateHeight))
        
        let lt = CAShapeLayer()
        lt.path = pt.cgPath
        lt.fillColor = UIColor.lightGray.cgColor
        lt.strokeColor = UIColor.darkGray.cgColor
        lt.lineWidth = 2
        lt.lineJoin = kCALineJoinBevel
        plate1 = lt
        self.layer.addSublayer(lt)
        
        let pb = UIBezierPath()
        pb.move(to: CGPoint(x: 0, y: self.frame.height))
        pb.addLine(to: CGPoint(x: plateHeight*2, y: self.frame.height-plateHeight))
        pb.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height-plateHeight))
        pb.addLine(to: CGPoint(x: self.frame.width-plateHeight*2, y: self.frame.height))
        pb.addLine(to: CGPoint(x: 0, y: self.frame.height))
        
        let lb = CAShapeLayer()
        lb.path = pb.cgPath
        lb.fillColor = UIColor.lightGray.cgColor
        lb.strokeColor = UIColor.darkGray.cgColor
        lb.lineWidth = 2
        lb.lineJoin = kCALineJoinBevel
        plate2 = lb
        self.layer.addSublayer(lb)
        
        if withSigns {
            setupSignLabels()
        }
        
        setupVerticalLines()
    }
    
    func setupSignLabels() {
        
        let plus = UILabel(frame: CGRect(x: self.frame.width/2-5, y: 2, width: 10, height: 10))
        plus.textAlignment = .center
        plus.font = UIFont.systemFont(ofSize: 13)
        plus.text = "+"
        plus.textColor = .white
        self.addSubview(plus)
        
        let minus = UILabel(frame: CGRect(x: self.frame.width/2-5, y: self.frame.height - 12, width: 10, height: 10))
        minus.textAlignment = .center
        minus.font = UIFont.systemFont(ofSize: 13)
        minus.text = "-"
        minus.textColor = .white
        self.addSubview(minus)
    }
    
    func setupVerticalLines() {
        let numberOfLines: Int = Int(self.frame.width) / Int(plateHeight) + 1
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: plateHeight))
        
        for i in 0..<numberOfLines {
            path.addLine(to: CGPoint(x: self.frame.width / CGFloat(numberOfLines) * CGFloat(i) + 5, y: self.frame.height - (i==0 ? 0 : plateHeight - 3)))
            path.move(to: CGPoint(x: self.frame.width / CGFloat(numberOfLines) * CGFloat(i+1) + 5, y: (i > numberOfLines-3 ? 5 : plateHeight)))
        }
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor(white: 1, alpha: 1).cgColor
        layer.lineWidth = 1
        layer.lineDashPattern = [4]
        self.layer.addSublayer(layer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
