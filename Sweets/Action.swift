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
    
    init(_ function: UIControl -> ()) {
        self.function = function
    }
    
    func fire(sender: UIControl) {
        function(sender)
    }
    
}
