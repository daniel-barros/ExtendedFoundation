//
//  Date.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 11/5/16.
//
//  Copyright (c) 2016 - 2017 Daniel Barros López
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

public extension Date {
    
    static var now: Date {
        return Date()
    }
    
    var isInPast: Bool {
        return timeIntervalSinceNow < 0
    }
    
    var isInFuture: Bool {
        return timeIntervalSinceNow > 0
    }
    
    @available(iOS 10, watchOS 3, tvOS 10, macOS 10.12, *)
    func adding(_ duration: Measurement<UnitDuration>) -> Date {
        return addingTimeInterval(duration.converted(to: .seconds).value)
    }
    
    @available(iOS 10, watchOS 3, tvOS 10, macOS 10.12, *)
    static func +(_ lhs: Date, _ rhs: Measurement<UnitDuration>) -> Date {
        return lhs.adding(rhs)
    }
    
    @available(iOS 10, watchOS 3, tvOS 10, macOS 10.12, *)
    static func -(_ lhs: Date, _ rhs: Measurement<UnitDuration>) -> Date {
        return lhs.adding(-rhs)
    }
    
    func adding(days: Int, inCalendar calendar: Calendar) -> Date {
        return calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    func adding(months: Int, inCalendar calendar: Calendar) -> Date {
        return calendar.date(byAdding: .month, value: months, to: self)!
    }
    
    func adding(years: Int, inCalendar calendar: Calendar) -> Date {
        return calendar.date(byAdding: .year, value: years, to: self)!
    }
    
    func hours(since date: Date) -> Int {
        return Int(timeIntervalSince(date)) / 3600
    }
    
    func minutes(since date: Date) -> Int {
        return Int(timeIntervalSince(date)) / 60
    }
    
    func seconds(since date: Date) -> Int {
        return Int(timeIntervalSince(date))
    }
    
    func hours(until date: Date) -> Int {
        return date.hours(since: self)
    }
    
    func minutes(until date: Date) -> Int {
        return date.minutes(since: self)
    }
    
    func seconds(until date: Date) -> Int {
        return date.seconds(since: self)
    }
}

