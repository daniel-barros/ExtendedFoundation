//
//  Calendar.swift
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

public extension Calendar {
    
    /// Gregorian calendar with US locale and ET time zone.
    static var americanEastern: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .american
        calendar.timeZone = .ET
        return calendar
    }
    
    /// Gregorian calendar with US locale and ET time zone.
    static var americanPacific: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .american
        calendar.timeZone = .PT
        return calendar
    }
    
    /// Gregorian calendar with Spanish locale and time zone.
    static var spanish: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .spanish
        calendar.timeZone = .spanish
        return calendar
    }
    
    
    /// The first moment of today.
    var today: Date {
        return startOfDay(for: Date())
    }
    
    /// The first moment of yesterday.
    var yesterday: Date {
        return date(byAdding: .day, value: -1, to: today)!
    }
    
    /// The first moment of tomorrow.
    var tomorrow: Date {
        return date(byAdding: .day, value: 1, to: today)!
    }
    
    
    func numberOfDays(from first: Date, to second: Date) -> Int {
        return dateComponents([.day], from: startOfDay(for: first), to: startOfDay(for: second)).day!
    }
    
    func numberOfMonths(from first: Date, to second: Date) -> Int {
        return dateComponents([.month], from: startOfDay(for: first), to: startOfDay(for: second)).month!
    }
    
    func numberOfYears(from first: Date, to second: Date) -> Int {
        return dateComponents([.year], from: startOfDay(for: first), to: startOfDay(for: second)).year!
    }
}
