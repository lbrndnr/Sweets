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

// This protocol is needed because Self can only be used in a protocol or as a return value
protocol UIControlGenericProtocol {
    func addAction(forControlEvents controlEvents: UIControlEvents, function: (Self) -> ())
}

extension UIControl: UIControlGenericProtocol {
    
    private var actions: Set<Action> {
        get {
            return objc_getAssociatedObject(self, actionsKey) as? Set<Action> ?? []
        }
        set(value) {
            objc_setAssociatedObject(self, actionsKey, value, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    public func addAction<T: UIControl>(forControlEvents controlEvents: UIControlEvents, function: (T) -> ()) {
        let action = Action(function as! (UIControl) -> (), controlEvents: controlEvents)
        if !actions.contains(action) {
            actions.insert(action)
            addTarget(action, action: selector, forControlEvents: controlEvents)
        }
    }
    
}
