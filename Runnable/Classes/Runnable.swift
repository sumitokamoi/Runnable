//
//  Runnable.swift
//  SpriteKitDemo02
//
//  Created by sumisonic on 2017/03/02.
//  Copyright © 2017年 rhizomatiks. All rights reserved.
//

import Foundation


// MARK: - protocol
public protocol Runnable {
    func run(completion: @escaping () -> Void)
    func cancel()
}


// MARK: - Parallel
open class RnParallel: Runnable {
    
    public let runnables: [Runnable]
    
    public init(_ runnables: [Runnable]) {
        self.runnables = runnables
    }
    
    public func run(completion: @escaping () -> Void) {
        var count = 0
        runnables.forEach {
            $0.run {
                count += 1
                if count == self.runnables.count { completion() }
            }
        }
    }
    
    public func cancel() {
        runnables.forEach{ $0.cancel() }
    }
}


// MARK: - Serial
open class RnSerial: Runnable {
    
    public let runnables: [Runnable]
    private var currentRunnable: Runnable?
    
    public init(_ runnables: [Runnable]) {
        self.runnables = runnables
    }
    
    public func run(completion: @escaping () -> Void) {
        self.runSerial(runnables, completion: completion)
    }
    
    private func runSerial(_ runnables:[Runnable], completion: @escaping () -> Void) {
        guard let (t, ts) = runnables.decompose else {
            currentRunnable = nil
            completion()
            return
        }
        currentRunnable = t
        t.run { self.runSerial(ts, completion: completion) }
    }
    
    public func cancel() {
        currentRunnable?.cancel()
    }
}


// Mark: - Array extension
fileprivate extension Array {
    public var decompose : (head: Element, tail: [Element])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

