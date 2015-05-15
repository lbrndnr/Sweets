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
    class OtherCell: UITableViewCell {}
    
    class HeaderFooterView: UITableViewHeaderFooterView {}
    class OtherHeaderFooterView: UITableViewHeaderFooterView {}
    
    
    override func spec() {
        var tableView: UITableView!
        
        beforeEach {
            tableView = UITableView()
            tableView.dataSource = self
        }
        
        describe("registering") {
            it("registers a cell") {
                tableView.registerReusableCellClass(Cell.self)
                let cell = tableView.dequeueReusableCell(Cell.self)
                
                expect(cell).to(beTruthy())
            }
            
            it("registers a header") {
                tableView.registerReusableHeaderFooterViewClass(HeaderFooterView.self)
                let view = tableView.dequeueReusableHeaderFooterView(HeaderFooterView.self)
                
                expect(view).to(beTruthy())
            }
        }
        
        describe("info retrieval") {
            it("retrieves cell") {
                let cell: Cell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
                expect(cell).to(beTruthy())
            }
            
            it("retrieves no cell") {
                let cell: OtherCell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
                expect(cell).to(beFalsy())
            }
            
            it("retrieves header footer view") {
                let headerView: HeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beTruthy())
                
                let footerView: HeaderFooterView? = tableView.footerViewForSection(0)
                expect(footerView).to(beTruthy())
            }
            
            it("retrieves no header footer view") {
                let headerView: OtherHeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beFalsy())
                
                let footerView: OtherHeaderFooterView? = tableView.footerViewForSection(0)
                expect(footerView).to(beFalsy())
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
        return tableView.dequeueReusableCell(Cell.self, indexPath: NSIndexPath(forRow: 0, inSection: 0))
    }

}
