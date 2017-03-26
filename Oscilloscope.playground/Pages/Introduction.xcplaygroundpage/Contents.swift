import UIKit
import PlaygroundSupport

/*:
 ## Introduction
 
Hello, reader!
 In this playgroundbook you'll learn the basic principles and components of an *oscilloscope*, a scientific device to display waveforms.
 In order to do so, we'll build our very own ***Digital Oscilloscope***.
 
 On the right you can see the display of an oscilloscope from the front, displaying a sine wave signal over time.
 Try changing the signal below to check out some other signals our oscilloscope will be able to display.
 
 */

let v = DisplayViewController()
PlaygroundPage.current.liveView = v

//v.display.xFunc = { x in return cos(x * CGFloat.pi) * 0.7 }
v.display.yFunc = { x in return sin(x * CGFloat.pi) * 0.4 }
//v.display.amplitude = 0.6
