//
//  Attractor.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import Foundation
import UIKit

struct Attractor {
    
    var x:CGFloat
    var y:CGFloat
    
    var radius: CGFloat
    
    init(px:CGFloat, py:CGFloat, radius:CGFloat) {
        self.x = px
        self.y = py
        self.radius = radius
    }
    
    func attract(node:inout Node) -> Void {
        
        let dx = (self.x - node.position.x)
        let dy = (self.y - node.position.y)
        
        let dist = sqrt(dx * dx + dy * dy)
        
        if dist > 0 && dist < self.radius {
            let s = dist / self.radius
            var  f = 1 / pow(s, 0.9) - 1;
            f /= self.radius
         
            node.velocity.x += dx * f
            node.velocity.y += dy * f
        }
        
    }
}
