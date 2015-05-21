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
        var invoked: Bool!
        
        beforeEach {
            func action(sender: UIControl) {
                invoked = true
                expect(sender).to(equal(control))
            }
            
            control = UIControl()
            control.setAction(action, forControlEvents: .TouchUpInside)
            
            invoked = false
        }

        describe("actions") {
            it("invokes an action") {
                control.sendActionsForControlEvents(.TouchUpInside)
                
                expect(invoked).to(beTrue())
            }
            
            it("invokes no action") {
                control.removeAction(forControlEvents: .TouchUpInside)
                control.sendActionsForControlEvents(.TouchUpInside)
                
                expect(invoked).to(beFalse())
            }
        }
    }
    
}
