//
//  UITableViewSpec.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Sweets
import UIKit
import Quick
import Nimble

class UITableViewSpec: QuickSpec, UITableViewDataSource, UITableViewDelegate {
    
    class RegisteredCell: UITableViewCell {}
    class Cell: UITableViewCell {}
    class RegisteredHeaderFooterView: UITableViewHeaderFooterView {}
    class HeaderFooterView: UITableViewHeaderFooterView {}
    
    override func spec() {
        var tableView: UITableView!
        
        beforeEach {
            tableView = UITableView(frame: UIScreen.mainScreen().bounds)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerReusableCellClass(RegisteredCell.self)
            tableView.registerReusableHeaderFooterViewClass(RegisteredHeaderFooterView.self)
            
            tableView.reloadData()
        }
        
        describe("dequeuing") {
            it("dequeues a cell") {
                let registeredCell = tableView.dequeueReusableCell(RegisteredCell.self)
                expect(registeredCell).to(beTruthy())
                
                let cell = tableView.dequeueReusableCell(Cell.self)
                expect(cell).to(beFalsy())
            }
            
            it("dequeues a header") {
                let registeredView = tableView.dequeueReusableHeaderFooterView(RegisteredHeaderFooterView.self)
                expect(registeredView).to(beTruthy())
                
                let view = tableView.dequeueReusableHeaderFooterView(HeaderFooterView.self)
                expect(view).to(beFalsy())
            }
        }
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        
        describe("info retrieval") {
            // These need to be in the same context so that the header retrieval passes
            it("retrieves views") {
                let cell: RegisteredCell? = tableView.cellForRowAtIndexPath(indexPath)
                expect(cell).to(beTruthy())
                
                let headerView: RegisteredHeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beTruthy())
                
                let footerView: RegisteredHeaderFooterView? = tableView.footerViewForSection(0)
                expect(footerView).to(beTruthy())
            }
            
            it("retrieves no views") {
                let cell: Cell? = tableView.cellForRowAtIndexPath(indexPath)
                expect(cell).to(beFalsy())
                
                let headerView: HeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beFalsy())
                
                let footerView: HeaderFooterView? = tableView.footerViewForSection(0)
                expect(footerView).to(beFalsy())
            }
            
            it("retrieves visible cells") {
                let registeredCells: [RegisteredCell] = tableView.visibleCells()
                expect(registeredCells).to(beTruthy())
                
                let cells: [Cell] = tableView.visibleCells()
                expect(cells).to(beEmpty())
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
        return tableView.dequeueReusableCell(RegisteredCell.self, indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(RegisteredHeaderFooterView.self)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(RegisteredHeaderFooterView.self)
    }

}
