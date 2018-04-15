//
//  ResultTests.swift
//  Tests
//
//  Created by Daniel Barros López on 4/15/18.
//  Copyright © 2018 Daniel Barros. All rights reserved.
//

import XCTest
import ExtendedFoundation

class ResultTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsSuccessful() {
        let r1 = Result<Int>.success(1)
        let r2 = Result<String>.failure(nil)
        let r3 = Result<String>.failure(NSError.init(domain: "", code: 0, userInfo: nil))
        XCTAssertTrue(r1.isSuccessful)
        XCTAssertFalse(r2.isSuccessful)
        XCTAssertFalse(r3.isSuccessful)
    }

    func testResult() {
        var r = Result<Int>.success(1)
        XCTAssertEqual(r.value, 1)
        XCTAssert(r.error == nil)
        XCTAssertEqual(r.isSuccessful, true)
        
        let error = NSError()
        r = .failure(error)
        XCTAssertEqual(r.value, nil)
        XCTAssert(r.error != nil)
        XCTAssertEqual(r.isSuccessful, false)
    }
}
