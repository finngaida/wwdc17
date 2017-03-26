//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let v = UIViewController()
let screen = Display(frame: CGRect(x: 40, y: 50, width: 300, height: 240))
v.view.addSubview(screen)

screen.xFunc = { i in return cos(i * CGFloat.pi) * 0.8 }
screen.yFunc = { i in return sin(i * 3 * CGFloat.pi) * 0.6 }

PlaygroundPage.current.liveView = v

//: [Next](@next)
