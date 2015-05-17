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
    class Cell: UITableViewCell {
    
        func coolPrint() {
            println("cool")
        }
        
    }
    
    class RegisteredHeaderFooterView: UITableViewHeaderFooterView {}
    class HeaderFooterView: UITableViewHeaderFooterView {}
    
    
    override func spec() {
        var window: UIWindow!
        var tableView: UITableView!
        var count = 1
        
        beforeEach {
            tableView = UITableView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerReusableCellClass(RegisteredCell.self)
            tableView.registerReusableHeaderFooterViewClass(RegisteredHeaderFooterView.self)
            
            window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.addSubview(tableView)
            tableView.frame = window.bounds
            tableView.reloadData()
        }
        
        describe("dequeuing") {
            it("dequeues a cell") {
                let cell = tableView.dequeueReusableCell(RegisteredCell.self)
                expect(cell).to(beTruthy())
            }
            
            it("dequeues no cell") {
                let cell = tableView.dequeueReusableCell(Cell.self)
                expect(cell).to(beFalsy())
            }
            
            it("dequeues a header") {
                let view = tableView.dequeueReusableHeaderFooterView(RegisteredHeaderFooterView.self)
                expect(view).to(beTruthy())
            }
            
            it("dequeues no header") {
                let view = tableView.dequeueReusableHeaderFooterView(HeaderFooterView.self)
                expect(view).to(beFalsy())
            }
        }
        
        describe("info retrieval") {
            it("retrieves cell") {
                let cell: RegisteredCell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
                expect(cell).to(beTruthy())
            }
            
            it("retrieves no cell") {
                let cell: Cell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
                expect(cell).to(beFalsy())
            }
            
            it("retrieves header footer view") {
                let headerView: RegisteredHeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beTruthy())
                
                let footerView: RegisteredHeaderFooterView? = tableView.footerViewForSection(0)
                expect(footerView).to(beTruthy())
            }
            
            it("retrieves no header footer view") {
                let headerView: HeaderFooterView? = tableView.headerViewForSection(0)
                expect(headerView).to(beFalsy())
                
                let footerView: HeaderFooterView? = tableView.footerViewForSection(0)
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
        return tableView.dequeueReusableCell(RegisteredCell.self, indexPath: NSIndexPath(forRow: 0, inSection: 0))
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
