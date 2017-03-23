//
//  Delay.swift
//  SpriteKitDemo02
//
//  Created by sumisonic on 2017/03/02.
//  Copyright © 2017年 rhizomatiks. All rights reserved.
//

import Foundation

open class RnWait: Runnable {
    
    let time:Double
    
    private var timer: Timer?
    private var completion: (() -> Void)?
    
    public init(_ time: Double) {
        self.time = time
    }
    
    public func run(completion: @escaping () -> Void) {
        self.completion = completion
        var timer = Timer.scheduledTimer(timeInterval: self.time,
                                         target: self,
                                         selector: #selector(self.update),
                                         userInfo: nil,
                                         repeats: false)
    }
    
    @objc public func update() {
        guard let completion = self.completion else {
            return
        }
        completion()
    }
    
    public func cancel() {
        timer?.invalidate()
        timer = nil
    }
}
