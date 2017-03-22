//
//  Tests.swift
//  Tests
//
//  Created by Daniel Barros López on 3/22/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import XCTest
import ExtendedFoundation

class ExtendedFoundationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testResultIsSuccessful() {
        let r1 = Result<Int>.success(1)
        let r2 = Result<String>.failure(nil)
        let r3 = Result<String>.failure(NSError.init(domain: "", code: 0, userInfo: nil))
        XCTAssertTrue(r1.isSuccessful)
        XCTAssertFalse(r2.isSuccessful)
        XCTAssertFalse(r3.isSuccessful)
    }
}
