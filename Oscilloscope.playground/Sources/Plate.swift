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
    
    func setupXPlates() {
        self.backgroundColor = .red
    }
    
    func setupYPlates() {
        let top = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 5))
        let bottom = UIView(frame: CGRect(x: 0, y: self.frame.height-5, width: self.frame.width, height: 5))
        
        [top, bottom].forEach {
            $0.backgroundColor = .red
            self.addSubview($0)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
