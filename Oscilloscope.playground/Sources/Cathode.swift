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
        
        self.layer.addSublayer(emitter)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
