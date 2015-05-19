//
//  UICollectionViewSpec.swift
//  Sweets
//
//  Created by Laurin Brandner on 17/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Sweets
import UIKit
import Quick
import Nimble

class UICollectionViewSpec: QuickSpec, UICollectionViewDataSource {

    class RegisteredCell: UICollectionViewCell {}
    class Cell: UICollectionViewCell {}
    
    class RegisteredSupplementaryView: UICollectionReusableView {}
    class SupplementaryView: UICollectionReusableView {}
    
    override func spec() {
        var collectionView: UICollectionView!
        var window: UIWindow!
        
        beforeEach {
            let layout = UICollectionViewFlowLayout()
            layout.headerReferenceSize = CGSize(width: 100, height: 100)
            
            collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
            collectionView.dataSource = self
            collectionView.registerReusableCellClass(RegisteredCell.self)
            collectionView.registerReusableSupplementaryViewClass(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionHeader)
            
            window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.addSubview(collectionView)
            collectionView.frame = window.bounds
            collectionView.reloadData()
        }
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        describe("dequeuing") {
            it("dequeues a cell") {
                let cell = collectionView.dequeueReusableCell(RegisteredCell.self, forIndexPath: indexPath)
                expect(cell).to(beTruthy())
            }
            
            it("dequeues a supplementary view") {
                let view = collectionView.dequeueReusableSupplementaryView(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
                expect(view).to(beTruthy())
            }
            
            it("dequeues no supplementary view") {
                let view = collectionView.dequeueReusableSupplementaryView(SupplementaryView.self, elementKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
                expect(view).to(beFalsy())
            }
        }
        
//        describe("info retrieval") {
//            it("retrieves cell") {
//                let cell: RegisteredCell? = collectionView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
//                expect(cell).to(beTruthy())
//            }
//            
//            it("retrieves no cell") {
//                let cell: Cell? = collectionView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
//                expect(cell).to(beFalsy())
//            }
//            
//            it("retrieves header footer view") {
//                let headerView: RegisteredHeaderFooterView? = collectionView.headerViewForSection(0)
//                expect(headerView).to(beTruthy())
//                
//                let footerView: RegisteredHeaderFooterView? = collectionView.footerViewForSection(0)
//                expect(footerView).to(beTruthy())
//            }
//            
//            it("retrieves no header footer view") {
//                let headerView: HeaderFooterView? = collectionView.headerViewForSection(0)
//                expect(headerView).to(beFalsy())
//                
//                let footerView: HeaderFooterView? = collectionView.footerViewForSection(0)
//                expect(footerView).to(beFalsy())
//            }
//        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(RegisteredCell.self, forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
    }

}
