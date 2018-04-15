//
//  CollectionTests.swift
//  Tests
//
//  Created by Daniel Barros López on 4/15/18.
//  Copyright © 2018 Daniel Barros. All rights reserved.
//

import XCTest
import ExtendedFoundation

class CollectionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSum() {
        let a = [1,2,-3,4,5]
        XCTAssertEqual(a.sum(), 9)
    }
}
