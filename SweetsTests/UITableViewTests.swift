//
//  TableViewTests.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Sweets
import UIKit
import Quick
import Nimble

class TableViewSpec: QuickSpec, UITableViewDataSource {
    
    class Cell: UITableViewCell {}
    
    override func spec() {
        
        describe("registering") {
            var tableView: UITableView!
        
            beforeEach {
                tableView = UITableView()
                tableView.dataSource = self
            }
            
            it("registers a cell") {
                tableView.registerReusableCellClass(Cell.self)
                let cell = tableView.dequeueReusableCell(Cell.self)
                
                expect(cell).to(beTruthy())
            }
            
            it("registers a header") {
                tableView.registerReusableHeaderFooterViewClass(UITableViewHeaderFooterView.self)
                let view = tableView.dequeueReusableHeaderFooterView(UITableViewHeaderFooterView.self)
                
                expect(view).to(beTruthy())
            }
        }
        
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(UITableViewCell.self, indexPath: NSIndexPath(forRow: 0, inSection: 0))
    }

}
