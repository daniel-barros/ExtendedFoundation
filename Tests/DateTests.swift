//
//  DateTests.swift
//  Tests
//
//  Created by Daniel Barros López on 4/15/18.
//  Copyright © 2018 Daniel Barros. All rights reserved.
//

import XCTest
import ExtendedFoundation

class DateTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testHoursMinutesSecondsSinceUntil() {
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
    
    func testAdding() {
        let date1 = Date()
        let date2 = date1.adding(days: 2, inCalendar: .current)
        let date3 = date1.adding(months: -1, inCalendar: .current)
        let date4 = date1.adding(years: 4, inCalendar: .current)
        
        XCTAssertEqual(date2, Calendar.current.date(byAdding: DateComponents(day: 2), to: date1))
        XCTAssertEqual(date3, Calendar.current.date(byAdding: DateComponents(month: -1), to: date1))
        XCTAssertEqual(date4, Calendar.current.date(byAdding: DateComponents(year: 4), to: date1))
    }
    
    func testOperators() {
        let a = Date.now
        XCTAssertEqual(a + 3.hours, a.addingTimeInterval(3*3600))
        XCTAssertEqual(a - 3.hours, a.addingTimeInterval(-3*3600))
    }
    
    func testNumberOfDays() {
        let d1 = Date.now
        let d2 = d1.adding(days: 7, inCalendar: .current)
        let d3 = d1.adding(days: -3, inCalendar: .current)
        let d4 = d2.adding(20.minutes)
        let d5 = d2.adding(-20.minutes)
        
        let n1 = Calendar.current.numberOfDays(from: d1, to: d2)
        let n2 = Calendar.current.numberOfDays(from: d1, to: d3)
        let n3 = Calendar.current.numberOfDays(from: d1, to: d4)
        let n4 = Calendar.current.numberOfDays(from: d1, to: d5)
        let n5 = Calendar.current.numberOfDays(from: d2, to: d4)
        let n6 = Calendar.current.numberOfDays(from: d2, to: d5)
        
        XCTAssertEqual(n1, 7)
        XCTAssertEqual(n2, -3)
        XCTAssertEqual(n3, 7)
        XCTAssertEqual(n4, 7)
        XCTAssertEqual(n5, 0)
        XCTAssertEqual(n6, 0)
    }
}
