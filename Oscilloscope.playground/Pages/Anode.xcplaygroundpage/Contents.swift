//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/*:
 Okay so we have the electrons flying around *somewhere*, but we need them to form an **electron beam**, to actually create a bright spot on the screen.
 
## Anode 
 As the electrons are negatively charged, how about we put a positively charged ***anode*** in front of the cathode?    
 This will attract the electrons and thereby accelerate them to the desired speed.      
 If we just put a hole in the middle of the anode we can also absorb all those electrons that don't go in the right direction and so we get our electron beam.
 
 -----
 
 Again there already is a class called `Anode` that we can use for our oscilloscope. Check it out by running this code:
 
 */

let v = AnodeViewController()
PlaygroundPage.current.liveView = v

//: [Next](@next)
