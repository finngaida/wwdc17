import UIKit

public class SideViewController: UIViewController {
    
    public var sideView: Sideview!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        sideView = Sideview()
        self.view.addSubview(sideView)
    }
    
    public override func viewDidLayoutSubviews() {
        sideView.frame = CGRect(x: 10, y: 10, width: self.view.bounds.width - 20, height: (self.view.bounds.width - 20) * 2/3)
    }
    
}
