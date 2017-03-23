//
//  Tween.swift
//  SpriteKitDemo02
//
//  Created by sumisonic on 2017/03/01.
//  Copyright © 2017年 rhizomatiks. All rights reserved.
//

import UIKit
import SpriteKit

open class RnSKTween: Runnable {
    let target: SKNode
    let time: Double
    let easing: (Double, Double, Double, Double) -> Double
    let params: [String: Double]
    let delay: Double
    let repeatNum: UInt
    let repeatDelay: Double
    let yoyo: Bool
    
    public init(target: SKNode, time: Double, easing: @escaping (Double, Double, Double, Double) -> Double, params: [String: Double], delay: Double, repeatNum: UInt, repeatDelay: Double, yoyo: Bool) {
        self.target = target
        self.time = time
        self.easing = easing
        self.params = params
        self.delay = delay
        self.repeatNum = repeatNum
        self.repeatDelay = repeatDelay
        self.yoyo = yoyo
    }
    
    public convenience init(target: SKNode, time: Double, easing: @escaping (Double, Double, Double, Double) -> Double, params: [String: Double]) {
        self.init(target: target, time: time, easing: easing, params: params, delay: 0.0, repeatNum: 0, repeatDelay: 0.0, yoyo: false)
    }
    
    public convenience init(target: SKNode, time: Double, easing: @escaping (Double, Double, Double, Double) -> Double, params: [String: Double], delay: Double) {
        self.init(target: target, time: time, easing: easing, params: params, delay: delay, repeatNum: 0, repeatDelay: 0.0, yoyo: false)
    }
    
    public convenience init(target: SKNode, time: Double, easing: @escaping (Double, Double, Double, Double) -> Double, params: [String: Double], yoyo: Bool) {
        self.init(target: target, time: time, easing: easing, params: params, delay: 0, repeatNum: 1, repeatDelay: 0.0, yoyo: yoyo)
    }
    
    public func run(completion: @escaping () -> Void) {
        
        var actions: [SKAction] = []
        
        //delay
        if (self.delay > 0.0) {
            actions.append(SKAction.wait(forDuration: self.delay))
        }
        
        //tween
        for i in 0...self.repeatNum {
            let reverse = self.yoyo && (i%2==1)
            let action = actionFromTween(target: self.target, time: self.time, easing: self.easing, params: self.params, reverse: reverse)
            actions.append(action)
            if (self.repeatDelay > 0.0) {
                actions.append(SKAction.wait(forDuration: self.repeatDelay))
            }
        }
        
        //skaction
        let sequence = SKAction.sequence(actions)
        target.run(sequence) {
            completion()
        }
    }
    
    public func cancel() {
        target.removeAllActions()
    }
    
    private func actionFromTween(target: SKNode, time: Double, easing: @escaping (Double, Double, Double, Double) -> Double, params: [String: Double], reverse: Bool) -> SKAction {
        let p = (start: currentParams(target: target, params: params), end: params)
        let action = SKAction.customAction(withDuration: time, actionBlock: { (node:SKNode, elapsedTime:CGFloat) -> Void in
            let ratio = (time > 0) ? (reverse == false) ? Double(elapsedTime)/Double(time) : 1.0 - (Double(elapsedTime)/Double(time)) : 1.0
            p.end.forEach {
                let start = p.start[$0.key]!
                let t: Double = ratio
                let b: Double = start
                let c: Double = $0.value - start
                let d: Double = 1.0
                let value = easing(t, b, c, d)
                node.setValue(CGFloat(value), forKey: $0.key)
            }
        })
        return action
    }
    
    private func currentParams(target:SKNode, params:[String: Double]) -> [String: Double] {
        var startParams: [String: Double] = [:]
        for param in params {
            startParams[param.key] = target.value(forKey: param.key) as? Double
        }
        return startParams
    }
}


public extension SKNode {
    /*
     // MARK: - params
     */
    public var x:Double {
        get {
            return Double(self.position.x)
        }
        set(newValue) {
            var p:CGPoint = self.position
            p.x = CGFloat(newValue)
            self.position = p
        }
    }
    
    public var y:Double {
        get {
            return Double(self.position.y)
        }
        set(newValue) {
            var p:CGPoint = self.position
            p.y = CGFloat(newValue)
            self.position = p
        }
    }
}


public extension SKEffectNode {
    public var blur:Double {
        get {
            let value = self.filter?.value(forKey: "inputRadius") as? Double
            return value ?? 0.0
        }
        set(newValue) {
            self.filter?.setValue(newValue, forKey: "inputRadius")
        }
    }
}

