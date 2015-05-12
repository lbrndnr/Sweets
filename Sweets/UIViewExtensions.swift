//
//  UIViewExtensions.swift
//  Sweets
//
//  Created by Laurin Brandner on 10/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

extension UIView {
    
    public class func animate(#duration: NSTimeInterval, delay: NSTimeInterval = 0, springDamping: CGFloat?, initialSpringVelocity springVelocity: CGFloat?, options: UIViewAnimationOptions = UIViewAnimationOptions(0), timingFunction: CAMediaTimingFunction? = nil, animations: () -> Void, completion: ((Bool) -> Void)? = nil) {
        CATransaction.begin()
        if let timingFunction = timingFunction {
            CATransaction.setAnimationTimingFunction(timingFunction)
        }
        
        if let springDamping = springDamping,
            springVelocity = springVelocity {
            animateWithDuration(duration, delay: delay, usingSpringWithDamping: springDamping, initialSpringVelocity: springVelocity, options: options, animations: animations, completion: completion)
        }
        else {
            animateWithDuration(duration, delay: delay, options: options, animations: animations, completion: completion)
        }
        
        CATransaction.commit()
    }
    
}
