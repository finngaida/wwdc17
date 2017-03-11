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
let screen = Display(frame: CGRect(x: 40, y: 50, width: 300, height: 240))
v.view.addSubview(screen)

screen.yFunc = { i in return sin((i-1) * CGFloat.pi) }
screen.amplitude = 0.6

PlaygroundPage.current.liveView = v

//: [Next](@next)
