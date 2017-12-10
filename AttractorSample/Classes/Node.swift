//
//  Node.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import Foundation
import UIKit

class Node {
    
    var position:CGPoint
    var velocity:CGPoint
    
    private var minX:CGFloat
    private var minY:CGFloat
    private var maxX:CGFloat
    private var maxY:CGFloat
    
    private var damping:CGFloat
    
    /// 初期化
    ///
    /// - Parameters:
    ///   - x: X座標
    ///   - y: Y座標
    init(x:CGFloat, y:CGFloat) {
        self.position = CGPoint(x: x, y: y)
        self.velocity = CGPoint(x: 0, y: 0)
        self.minX = 0.0
        self.minY = 0.0
        self.maxX = 0.0
        self.maxY = 0.0
        self.damping = 0.01
    }
    
    /// Region登録
    ///
    /// - Parameters:
    ///   - minX: 最小X座標
    ///   - minY: 最小Y座標
    ///   - maxX: 最大X座標
    ///   - maxY: 最大Y座標
    func setRegion(minX:CGFloat, minY:CGFloat, maxX:CGFloat, maxY:CGFloat) {
        self.minX = minX
        self.minY = minY
        self.maxX = maxX
        self.maxY = maxY
    }
}

extension Node: EnableAnimation {
    
    func update() {
        
        self.position.x += self.velocity.x
        self.position.y += self.velocity.y
        
        if(self.position.x < self.minX) {
            self.position.x = self.minX - (self.position.x - self.minX);
            self.velocity.x = -self.velocity.x;
        }
        
        if self.position.x > self.maxX {
            self.position.x = self.maxX - (self.position.x - self.maxX);
            self.velocity.x = -self.velocity.x;
        }
        
        if self.position.y < self.minY {
            self.position.y = self.minY - (self.position.y - self.minY);
            self.velocity.y = -self.velocity.y;
        }
        
        if position.y > maxY {
            self.position.y = self.maxY - (self.position.y - self.maxY);
            self.velocity.y = -self.velocity.y;
        }
     
        
        // 減衰値
        self.velocity.x = self.velocity.x * (1-damping);
        self.velocity.y = self.velocity.y * (1-damping);
        
    }
    
    func draw() {
        
    }

}
