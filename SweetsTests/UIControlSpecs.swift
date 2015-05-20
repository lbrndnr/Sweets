//
//  UIControlSpecs.swift
//  Sweets
//
//  Created by Laurin Brandner on 20/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Sweets
import UIKit
import Quick
import Nimble

class UIControlSpecs: QuickSpec {
    
    override func spec() {
        var control: UIControl!
        
        beforeEach {
            control = UIControl()
        }

        describe("actions") {
            it("should invoke actions") {
                var invokedA = false
                
                func setInvokedA(sender: UIControl) {
                    invokedA = true
                    expect(sender).to(equal(control))
                }
                
                control.addAction(forControlEvents: .TouchUpInside, function: setInvokedA)
                
                var invokedB = false
                control.addAction(forControlEvents: .TouchUpInside) { sender in
                    invokedB = true
                    expect(sender).to(equal(control))
                }
                
                control.sendActionsForControlEvents(.TouchUpInside)
                
                expect(invokedA).to(beTrue())
                expect(invokedB).to(beTrue())
            }
        }
    }
    
}
