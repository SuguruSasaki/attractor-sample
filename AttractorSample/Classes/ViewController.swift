//
//  ViewController.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var engine: SimpleAnimationEngine = SimpleAnimationEngine.shared
    var attractor: Attractor!
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    var nodes:[Node] = []
    var isPressed:Bool = false
    
    var shapeLayer:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        let math = Math()
        for _ in (0..<500) {
            let x:CGFloat = math.random(lowerValue:0, upperValue: self.view.frame.width - 2)
            let y:CGFloat = math.random(lowerValue:0, upperValue: self.view.frame.height - 2)
            let vx:CGFloat = math.random(lowerValue: -5, upperValue: 5)
            let vy:CGFloat = math.random(lowerValue: -5, upperValue: 5)
            let node = Node(x: x, y: y)
            node.velocity.x = vx
            node.velocity.y = vy
            node.setRegion(minX: 0, minY: 0, maxX: self.view.frame.width, maxY: self.view.frame.height)
            self.nodes.append(node)
        }
        
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer.frame = UIScreen.main.bounds
        self.shapeLayer.fillColor = UIColor.white.cgColor
        self.view.layer.addSublayer(self.shapeLayer)
        
        self.attractor = Attractor(px: self.view.frame.width/2, py: self.view.frame.height/2, radius: 200)
        self.mouseX = self.view.frame.width/2
        self.mouseY = self.view.frame.height/2
        
        self.engine.initalize(fps: 60)
        self.engine.addAnimation(listener: self)
        self.engine.start()
    }
}

extension ViewController: EnableAnimation {
    
    func update() {
        
        self.attractor.x = self.mouseX
        self.attractor.y = self.mouseY
        
        self.nodes.forEach { (node:Node) in
            var n = node
            if self.isPressed {
                self.attractor.attract(node: &n)
            }
            node.update()
        }
    }
    
    func draw() {
        let path = UIBezierPath()
        self.nodes.forEach { (node:Node) in
            path.addArc(withCenter: node.position, radius: 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            path.close()
        }
        self.shapeLayer.path = path.cgPath
    }
}

// Touch処理
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first
        let tapLocation = first?.location(in: self.view)
        guard let pos = tapLocation else {
            return
        }
        self.mouseX = pos.x
        self.mouseY = pos.y
        
        self.isPressed = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first
        let tapLocation = first?.location(in: self.view)
        guard let pos = tapLocation else {
            return
        }
        self.mouseX = pos.x
        self.mouseY = pos.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isPressed = false
    }
}
