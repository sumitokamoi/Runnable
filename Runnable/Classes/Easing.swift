//
//  Easing.swift
//  SpriteKitDemo02
//
//  Created by sumisonic on 2017/02/28.
//  Copyright © 2017年 rhizomatiks. All rights reserved.
//

import Foundation

public protocol EasingCurve {
    static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double
    static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double
    static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double
    static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double
}


public struct Easing {
    
    // MARK: Linear
    public struct Linear: EasingCurve {
        public static func easeNone(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return ((c * t) / d) + b
        }
        
        public static func easeIn(_ t: Double, _ b: Double, _ c: Double, _ d: Double) -> Double {
            return easeNone(t, b, c, d)
        }
        
        public static func easeOut(_ t: Double, _ b: Double, _ c: Double, _ d: Double) -> Double {
            return easeNone(t, b, c, d)
        }
        
        public static func easeInOut(_ t: Double, _ b: Double, _ c: Double, _ d: Double) -> Double {
            return easeNone(t, b, c, d)
        }
        
        public static func easeOutIn(_ t: Double, _ b: Double, _ c: Double, _ d: Double) -> Double {
            return easeNone(t, b, c, d)
        }
    }
    
    
    // MARK: Quad
    public struct Quad: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t/d
            return c*t*t+b
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t/d
            return (-c)*t*(t-2)+b
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t/(d/2)
            if t<1 {return c/2*t*t + b}
            t = t - 1
            return (-c)/2 * (t*(t-2) - 1) + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < d/2 { return easeOut(t*2, b, c/2, d) }
            else { return easeIn((t*2)-d, b+c/2, c/2, d) }
        }
    }
    
    // MARK: Cubic
    public struct Cubic: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t / d
            return((((c * t) * t) * t) + b)
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = (t / d) - 1
            return((c * (((t * t) * t) + 1)) + b)
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t / (d / 2)
            if (t < 1) {
                return(((((c / 2) * t) * t) * t) + b)
            }
            t = t - 2
            return(((c / 2) * (((t * t) * t) + 2)) + b)
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < (d / 2) {
                return easeOut(t * 2, b, c/2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c/2, d)
        }
    }
    
    // MARK: Quart
    public struct Quart: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t / d
            return(((((c * t) * t) * t) * t) + b)
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = (t / d) - 1
            return(((-c) * ((((t * t) * t) * t) - 1)) + b)
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t / (d / 2)
            if (t < 1) {
                return((((((c / 2) * t) * t) * t) * t) + b)
            }
            t = t - 2
            return((((-c) / 2) * ((((t * t) * t) * t) - 2)) + b)
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < (d / 2) {
                return easeOut(t * 2, b, c / 2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c / 2, d)
        }
    }
    
    
    // MARK: Quint
    public struct Quint: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t / d
            return((((((c * t) * t) * t) * t) * t) + b)
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = (t / d) - 1
            return((c * (((((t * t) * t) * t) * t) + 1)) + b)
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t / (d / 2)
            if (t < 1) {
                return(((((((c / 2) * t) * t) * t) * t) * t) + b)
            }
            t = t - 2
            return(((c / 2) * (((((t * t) * t) * t) * t) + 2)) + b)
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if (t < (d / 2)) {
                return easeOut(t * 2, b, c / 2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c / 2, d)
        }
    }
    
    // MARK: Sine
    public struct Sine: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return((((-c) * cos((t / d) * (M_PI/2))) + c) + b)
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return((c * sin((t / d) * (M_PI/2))) + b)
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return((((-c) / 2) * (cos((M_PI * t) / d) - 1)) + b)
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if (t < (d / 2)) {
                return easeOut(t * 2, b, c / 2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c / 2, d)
        }
    }
    
    // MARK: Expo
    public struct Expo: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return ((t == 0) ? (b) : (((c * pow(2, 10 * ((t / d) - 1))) + b) - (c * 0.001)))
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return ((t == d) ? (b + c) : (((c * 1.001) * ((-pow(2, (-10 * t) / d)) + 1)) + b))
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if (t == 0) {
                return(b)
            }
            if (t == d) {
                return(b + c)
            }
            var t:Double = t / (d / 2)
            if (t < 1) {
                return (((c / 2) * pow(2, 10 * (t - 1))) + b) - (c * 0.0005)
            }
            t -= 1
            return (((c / 2) * 1.0005) * ((-pow(2, -10 * t)) + 2)) + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if (t < (d / 2)) {
                return easeOut(t * 2, b, c / 2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c / 2, d)
        }
    }
    
    // MARK: Circ
    public struct Circ: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = t / d
            return ((-c) * (sqrt( max(1 - (t * t), 0) ) - 1)) + b
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let t:Double = (t / d) - 1
            return (c * sqrt(1 - (t * t))) + b
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t / (d / 2)
            if t < 1 {
                return (((-c) / 2) * (sqrt(1 - (t * t)) - 1)) + b
            }
            t-=2
            return (c/2 * (sqrt(1 - (t * t)) + 1)) + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < (d / 2) {
                return easeOut(t * 2, b, c / 2, d)
            }
            return easeIn((t * 2) - d, b + (c / 2), c / 2, d)
        }
    }
    
    // MARK: Elastic
    public struct Elastic: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t==0 {return b}
            
            var t:Double = t/d
            if t==1 {return b+c}
            
            var s:Double = 1.70158
            let p:Double = d*0.3
            var a:Double = c
            
            if a < abs(c) {
                a=c
                s=p/4
            }
            else {
                s = p/(2*M_PI) * asin (c/a)
            }
            
            t-=1
            return -(a*pow(2,10*t) * sin( (t*d-s)*(2*M_PI)/p )) + b
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t==0 {return b}
            
            let t:Double = t/d
            if t==1 {return b+c}
            
            var s:Double = 1.70158
            let p:Double = d*0.3
            var a:Double = c
            
            if a < abs(c) {
                a=c
                s=p/4
            }
            else {
                s = p/(2*M_PI) * asin (c/a)
            }
            return a*pow(2,-10*t) * sin((t*d-s)*(2*M_PI)/p ) + c + b
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t==0 {return b}
            
            var t:Double = t/(d/2)
            if t==1 {return b+c}
            
            var s:Double = 1.70158
            let p:Double = d*0.3*1.5
            var a:Double = c
            
            if a < abs(c) {
                a=c
                s=p/4
            }
            else {
                s = p/(2*M_PI) * asin (c/a)
            }
            
            if t < 1 {
                t-=1
                return -0.5*(a*pow(2,10*t) * sin( (t*d-s)*(2*M_PI)/p )) + b
            }
            t-=1
            return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p )*0.5 + c + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < d/2 {
                return easeOut(t*2, b, c/2, d)
            }
            return easeIn((t*2)-d, b+c/2, c/2, d)
        }
    }
    
    // MARK: Back
    public struct Back: EasingCurve {
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let s:Double = 1.70158
            let t:Double = t/d
            return c*t*t*((s+1)*t - s) + b
        }
        
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            let s:Double = 1.70158
            let t:Double = t/d-1
            return c*(t*t*((s+1)*t + s) + 1) + b
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var s:Double = 1.70158
            var t:Double = t/(d/2)
            if t < 1 {
                s*=1.525
                return c/2*(t*t*((s+1)*t - s)) + b
            }
            t-=2
            s*=1.525
            return c/2*(t*t*((s+1)*t + s) + 2) + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < d/2 {return easeOut(t*2, b, c/2, d)}
            return easeIn((t*2)-d, b+c/2, c/2, d)
        }
    }
    
    // MARK: Bounce
    public struct Bounce: EasingCurve {
        public static func easeOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            var t:Double = t/d
            if t < (1/2.75) {
                return c*(7.5625*t*t) + b
            }
            else if t < (2/2.75) {
                t-=1.5/2.75
                return c*(7.5625*t*t + 0.75) + b
            }
            else if t < (2.5/2.75) {
                t-=(2.25/2.75)
                return c*(7.5625*t*t + 0.9375) + b
            }
            else {
                t-=(2.625/2.75)
                return c*(7.5625*t*t + 0.984375) + b
            }
        }
        
        public static func easeIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            return c - easeOut(d-t, 0, c, d) + b
        }
        
        public static func easeInOut(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < d*0.5 {
                return easeOut(t*2, 0, c, d) * 0.5 + b
            }
            return easeOut(t*2-d, 0, c, d) * 0.5 + c*0.5 + b
        }
        
        public static func easeOutIn(_ t:Double, _ b:Double, _ c:Double, _ d:Double) -> Double {
            if t < d/2 {
                return easeOut(t*2, b, c/2, d)
            }
            return easeIn((t*2)-d, b+c/2, c/2, d)
        }
    }
}
