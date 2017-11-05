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
    
    func test_Result_isSuccessful() {
        let r1 = Result<Int>.success(1)
        let r2 = Result<String>.failure(nil)
        let r3 = Result<String>.failure(NSError.init(domain: "", code: 0, userInfo: nil))
        XCTAssertTrue(r1.isSuccessful)
        XCTAssertFalse(r2.isSuccessful)
        XCTAssertFalse(r3.isSuccessful)
    }
    
    func test_Date_hoursMinutesSecondsSinceUntil() {
        let date1 = Date()
        let date2 = Date().adding(1.hours)
        let date3 = Date().adding(59.minutes)
        let date4 = Date().adding(2.seconds)
        
        XCTAssertEqual(date1.hours(since: date2), -1)
        XCTAssertEqual(date1.hours(until: date2), 1)
        XCTAssertEqual(date1.hours(until: date1), 0)
        XCTAssertEqual(date1.hours(since: date3), 0)
        XCTAssertEqual(date1.hours(until: date3), 0)
        XCTAssertEqual(date1.minutes(since: date3), date3.minutes(until: date1))
        XCTAssertEqual(date1.minutes(until: date3), 59)
        XCTAssertEqual(date1.seconds(since: date4), -2)
    }
    
    func test_Date_Operators() {
        let a = Date.now
        XCTAssertEqual(a + 3.hours, a.addingTimeInterval(3*3600))
        XCTAssertEqual(a - 3.hours, a.addingTimeInterval(-3*3600))
    }
    
    func test_Dictionary_flatMapValues() {
        let a = ["a": 1, "b": 2, "c": -3]
        let b = ["a": 1, "b": 2]
        let c = a.flatMapValues { return $0 > 0 ? $0 : nil }
        XCTAssertEqual(b, c)
    }
    
    func test_Collection_sum() {
        let a = [1,2,-3,4,5]
        XCTAssertEqual(a.sum(), 9)
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
