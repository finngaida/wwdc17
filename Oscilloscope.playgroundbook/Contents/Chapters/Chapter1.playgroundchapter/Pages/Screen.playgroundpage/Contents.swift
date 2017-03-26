/*:
 So we have our electron beam now, awesome!
 The human eye can't see electrons though, so we need something to display this ray.
 
 ## Flurescence
 The earliest reports of this phenomenon date back to the 16th century and in the first half of the 19th century it was further described as the *change of wavelength of light* falling onto such a material.
 
 ***What is that supposed to mean?***
 Explaining luminescence as a whole or even fluorescence could take up an entire book by itself as it reaches out into physics, chemistry and optics.
 I'll try to break down the most important observations:
 
 - There are several special materials that have an luminescent effect, so you can't observe this phenomenon on just any surface
 - Luminescence is separated into seperate subcategories, roughly divided into the different materials, one of which is fluorescence - the *luminescence of **fluor***
 - Now to the core priciple: These materials emit light of a special *wavelength* if hit by electromagentic radiation.
 This radiation might well be visible light (such as sunrays ☀️ or light from a lamp 💡), though it could also be ultraviolet or infrared light or - you guessed it - an electron beam.
 - Every material has different characteristics, some shift the wavelength up, some down (so for example when you light it with infrared light, it might light up in blue)
 - The material commonly used in oscilloscope screens is a *phosphor* called **`P31`** which constists of *zinc*,  *sulfur* and *copper*
 
 > To sum it up the screen is coated in a material that, when hit by an electron beam, lights up in a green-ish color
 
 -----
 
 The kit provides a `Display` class that represents such a screen and can be seen to the right →
 
 */

let /*#-editable-code*/display/*#-end-editable-code*/ = Display()

//#-hidden-code
import PlaygroundSupport
PlaygroundPage.current.assessmentStatus = .pass(message: nil)
//#-end-hidden-code

//: [⏮ Previous](@previous) | [Next ⏭](@next)
