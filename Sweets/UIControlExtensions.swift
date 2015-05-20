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

extension UIControl {
    
    private var actions: [Action] {
        get {
            if let actions = objc_getAssociatedObject(self, actionsKey) as? [Action] {
                return actions
            }
            return []
        }
        set(value) {
            objc_setAssociatedObject(self, actionsKey, value, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    public func addAction(forControlEvents controlEvents: UIControlEvents, function: (UIControl) -> ()) {
        let action = Action(function)
        actions.append(action)
        addTarget(action, action: "fire:", forControlEvents: controlEvents)
    }
    
}
