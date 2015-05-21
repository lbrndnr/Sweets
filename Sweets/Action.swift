//
//  Action.swift
//  Sweets
//
//  Created by Laurin Brandner on 20/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Foundation

class Action: NSObject {
    let function: UIControl -> ()
    let controlEvents: UIControlEvents    
    
    init(_ function: UIControl -> (), controlEvents: UIControlEvents) {
        self.function = function
        self.controlEvents = controlEvents
    }
    
    func fire(sender: UIControl) {
        function(sender)
    }
    
}
