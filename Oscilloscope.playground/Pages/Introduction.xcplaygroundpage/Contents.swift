//: [Previous](@previous)

/*: 
 
 ## This is a title
 This is sample **bold**, *italic*, `code` and [linked](link) text.
 
 */
 
//: `/*#-hidden-code*/`
//: `hidden`
//: `/*#-end-hidden.code*/`

//: `/*#-code-completion(everything, hide)*/`
//: `/*#-code-completion(identifier, show, vorschlag1, vorschlag2, ...)*/`
//: `irgendeineFunktion(/*#-editable-code*/editable mit vorschlägen/*#-end-editable-code*/)`
//: `/*#-code-completion(everything, show)*/`

//: `![image](spark.png)`


import UIKit
import PlaygroundSupport

let v = UIViewController()
let side = Sideview(frame: CGRect(x: 0, y: 0, width: 370, height: 270))
v.view.addSubview(side)

let screen = Display(frame: CGRect(x: 40, y: 300, width: 300, height: 200))
v.view.addSubview(screen)

PlaygroundPage.current.liveView = v

//: [Next](@next)
