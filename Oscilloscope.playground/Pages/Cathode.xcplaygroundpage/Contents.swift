//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/*:
 Okay so we outlined the steps neccessary to build an oscilloscope, and the first one is to get a lot of electrons.
 
 Now luckily **Mr. Thomas Edison** (yes, *that* Edison 👴🏻)
 ![Edison](edison.jpg)
 
 in 1880 discovered the *Edison effect* or more scientifically *thermal electron emission effect*.
> To be fair, he didn't really discover it, he just found a use for it 💡 and patented it, it was initially found by the french 🇫🇷 *Edmond Bequerel* and further contributed to by various other physicists.
 
## Edison effect
 The thesis is, that, when you heat a filament with applied voltage to high temperatures around **1000K**, it will start emitting electrodes.   
> There's various different ways of creating an *electron gun*, but this approach is the most commonly used and also the one we'll focus on in this book.

 ## Cathode
 Cool, so all we have to do is to wire up a spiral filament with a power source and make sure it gets hot enough to get our *electron source*.
 
 ------
 
 Luckily there's the `Cathode` class, that we can use as a component for our oscilloscope.      
 Press play ▶️ below to run your code and see what it looks like.
 
 */

let v = UIViewController()
let cathode = Cathode(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
v.view.addSubview(cathode)

PlaygroundPage.current.liveView = v

//: [Next](@next)
