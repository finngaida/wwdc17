/*: 
 
 ## Table of contents

 - [Introduction](Introduction)
 - [Cathode](Cathode)
 - [Anode](Anode)
 - [Deflection System](DeflectionSystem)
 - [Screen](Screen)
 - [Signals](Signals)
 - [Playground](Playground)
 
 */

import UIKit
import PlaygroundSupport

let v = UIViewController()
let side = Sideview(frame: CGRect(x: 10, y: 10, width: 350, height: 250))
v.view.addSubview(side)

PlaygroundPage.current.liveView = v
