//
//  SimpleAnimationEngine.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import Foundation
import UIKit

class SimpleAnimationEngine {
    
    public static let shared: SimpleAnimationEngine = SimpleAnimationEngine()
    private var thread:Thread?
    private var isRunning:Bool   = true
    private var fps:TimeInterval = 0
    private var displayLink:CADisplayLink?
    
    private var listeners:[EnableAnimation] = []
    
    /// 初期化
    private init(){}
    
    ///
    func initalize(fps:TimeInterval) -> Void {
        self.fps = fps
    }
    
    /// 稼働中かどうか調べる
    func isEngineRunning() -> Bool {
        return self.isRunning
    }
    
    
    /// アニメーションの追加
    ///
    /// - Parameter listener: リスナーオブジェクトを追加
    func addAnimation(listener:EnableAnimation) -> Void {
        self.listeners.append(listener)
    }
    
    func start() -> Void {
        self.isRunning = true
        self.thread = Thread(target: self, selector: #selector(self.threadLoop(_:)), object: nil)
        self.thread?.start()
    }
    
    func stop() -> Void {
        self.displayLink?.remove(from: RunLoop.current, forMode: .defaultRunLoopMode)
        self.displayLink = nil
        self.isRunning   = false
    }
    
    @objc func threadLoop(_ sender:AnyObject) -> Void {
        self.displayLink = CADisplayLink(target: self, selector: #selector(self.engineLoop(_:)))
        self.displayLink?.preferredFramesPerSecond = Int(self.fps)
        self.displayLink?.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
        while self.isRunning {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 1/fps))
        }
    }
    
    @objc func engineLoop(_ sender:AnyObject) -> Void {
        self.update()
        self.draw()
    }
    
    private func update() -> Void {
        self.listeners.forEach { (animation: EnableAnimation) in
            animation.update()
        }
    }
    
    private func draw() -> Void {
        self.listeners.forEach { (animation: EnableAnimation) in
            animation.draw()
        }
    }
}
