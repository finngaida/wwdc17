/*:
 ## Introduction
 
 Hello, reader! 👋🏻
 
 In this playgroundbook you'll learn the basic principles and components of an *oscilloscope*, a scientific device to display waveforms.
 In order to do so, we'll build our very own ***Digital Oscilloscope***.
 
 On the right you can see the display of an oscilloscope from the front, displaying a sine wave signal over time.
 Try changing the signal below to check out some other signals our oscilloscope will be able to display.
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let oscilloscope = DisplayViewController()
PlaygroundPage.current.liveView = oscilloscope

func sine() -> Func { return Func.sine }
func doubleSine() -> Func { return Func.doubleSine }
func cosine() -> Func { return Func.cosine }
func doubleCosine() -> Func { return Func.doubleCosine }
//#-end-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, sine(), doubleSine(), cosine(), doubleCosine())
let newFunc: Func = /*#-editable-code*/<#cosine()#>/*#-end-editable-code*/

//#-code-completion(everything, hide)
//#-code-completion(literal, show, 0.6)
oscilloscope.display.amplitude = /*#-editable-code*/<#T##0.6##CGFloat#>/*#-end-editable-code*/
//#-end-editable-code

//#-hidden-code
DispatchQueue.main.async() {
    oscilloscope.display.yFunc = newFunc.toFunc()
    PlaygroundPage.current.assessmentStatus = .pass(message: "**Well done!** You can now skip to the [next page](@next).")
}
//#-end-hidden-code
//: [Next ⏭](@next)
