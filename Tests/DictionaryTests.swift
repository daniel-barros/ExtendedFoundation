//
//  DictionaryTests.swift
//  Tests
//
//  Created by Daniel Barros López on 4/15/18.
//  Copyright © 2018 Daniel Barros. All rights reserved.
//

import XCTest
import ExtendedFoundation

class DictionaryTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFlatMapValues() {
        let a = ["a": 1, "b": 2, "c": -3]
        let b = ["a": 1, "b": 2]
        let c = a.flatMapValues { return $0 > 0 ? $0 : nil }
        
        XCTAssertEqual(b, c)
    }
}
