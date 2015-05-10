//
//  CAMediaTimingFunction.swift
//  Sweets
//
//  Created by Laurin Brandner on 10/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Foundation

extension CAMediaTimingFunction {
    
    class func swiftOutFunction() -> CAMediaTimingFunction {
        return CAMediaTimingFunction(controlPoints: 0.4, 0.0, 0.2, 1.0)
    }
    
}
