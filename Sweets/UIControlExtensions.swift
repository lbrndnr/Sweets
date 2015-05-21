//
//  UIControlExtensions.swift
//  Sweets
//
//  Created by Laurin Brandner on 20/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit
import ObjectiveC

private let actionsKey = "actions"
private let selector: Selector = "fire:"

extension UIControl {
    
    private var actions: [UInt: Action] {
        get {
            return objc_getAssociatedObject(self, actionsKey) as? [UInt: Action] ?? [:]
        }
        set(value) {
            objc_setAssociatedObject(self, actionsKey, value, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    public func setAction(function: (UIControl) -> (), forControlEvents controlEvents: UIControlEvents) {
        let action = Action(function, controlEvents: controlEvents)
        
        actions[controlEvents.rawValue] = action
        addTarget(action, action: selector, forControlEvents: controlEvents)
    }
    
    public func removeAction(forControlEvents controlEvents: UIControlEvents) {
        let action = actions.removeValueForKey(controlEvents.rawValue)
        removeTarget(action, action: selector, forControlEvents: controlEvents)
    }
    
}
