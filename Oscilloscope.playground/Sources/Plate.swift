import UIKit

public class Plate: UIView {
    
    public enum Mode {
        case x, y
    }
    
    var mode: Mode
    
    public init(frame: CGRect, mode: Mode) {
        self.mode = mode
        super.init(frame: frame)

        switch mode {
        case .x: setupXPlates()
        case .y: setupYPlates()
        }
    }
    
    let plateHeight: CGFloat = 15
    func setupXPlates() {
        self.backgroundColor = .red
    }
    
    func setupYPlates() {
        let pt = UIBezierPath()
        pt.move(to: CGPoint(x: 0, y: plateHeight))
        pt.addLine(to: CGPoint(x: plateHeight*2, y: 0))
        pt.addLine(to: CGPoint(x: self.frame.width, y: 0))
        pt.addLine(to: CGPoint(x: self.frame.width-plateHeight*2, y: plateHeight))
        pt.addLine(to: CGPoint(x: 0, y: plateHeight))
        
        let pb = UIBezierPath()
        pb.move(to: CGPoint(x: 0, y: self.frame.height))
        pb.addLine(to: CGPoint(x: plateHeight*2, y: self.frame.height-plateHeight))
        pb.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height-plateHeight))
        pb.addLine(to: CGPoint(x: self.frame.width-plateHeight*2, y: self.frame.height))
        pb.addLine(to: CGPoint(x: 0, y: self.frame.height))
        
        [pt, pb].forEach {
            let l = CAShapeLayer()
            l.path = $0.cgPath
            l.fillColor = UIColor.lightGray.cgColor
            l.strokeColor = UIColor.darkGray.cgColor
            l.lineWidth = 2
            l.lineJoin = kCALineJoinBevel
            self.layer.addSublayer(l)
        }
        
        setupVerticalLines()
    }
    
    func setupVerticalLines() {
        let numberOfLines: Int = Int(self.frame.width) / Int(plateHeight) + 1
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: plateHeight))
        
        for i in 0..<numberOfLines {
            path.addLine(to: CGPoint(x: self.frame.width / CGFloat(numberOfLines) * CGFloat(i) + 5, y: self.frame.height - (i%2==0 && i<numberOfLines-3 ? 0 : plateHeight - 3)))
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
