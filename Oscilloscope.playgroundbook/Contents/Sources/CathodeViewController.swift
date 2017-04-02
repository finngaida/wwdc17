import UIKit

public class CathodeViewController: UIViewController {
    
    public var cathode: Cathode!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        cathode = Cathode()
        cathode.emitter.lifetime = 3
        cathode.emitter.masksToBounds = false
        
        self.view.addSubview(cathode)
    }
    
    public override func viewDidLayoutSubviews() {
        cathode.center = CGPoint(x: self.view.center.x/4, y: self.view.center.y)
    }
    
}
