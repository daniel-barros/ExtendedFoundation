//
//  Operators.swift
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


infix operator =? : AssignmentPrecedence

/// Performs assignment only if the element on the right is not nil, otherwise it does nothing.
///
/// **Example:**
///
/// a =? b
///
/// *is equivalent to:*
///
/// if let c = b { a = c }
public func =? <T>(left: inout T, right: T?) {
    if let right = right {
        left = right
    }
}

/// Performs assignment only if the element on the right is not nil, otherwise it does nothing.
///
/// **Example:**
///
/// a =? b
///
/// *is equivalent to:*
///
/// if let c = b { a = c }
public func =? <T>(left: inout T?, right: T?) {
    if let right = right {
        left = right
    }
}

/// Performs assignment only if the element on the right is not nil, otherwise it does nothing.
///
/// **Example:**
///
/// a =? b
///
/// *is equivalent to:*
///
/// if let c = b { a = c }
public func =? <T>(left: inout T!, right: T?) {
    if let right = right {
        left = right
    }
}


/// Minus sign operator for measurements.
@available(iOS 10, watchOS 3, tvOS 10, macOS 10.12, *)
public prefix func - <T: Unit>(measurement: Measurement<T>) -> Measurement<T> {
    return Measurement<T>(value: -measurement.value, unit: measurement.unit)
}


/// A collection of elements whose comparison to an element of the same type has the same effect as comparing each one of the elements in the collection to that element disjunctively.
///
/// It can only be instantiated using the || operator on instances of the same Equatable type (not Bool).
///
/// **Example:**
///
/// a == (1 || 2 || 3)
///
/// *is equivalent to:*
///
/// a == 1 || a == 2 || a == 3
public struct DisjunctiveComparisonArray<T: Equatable> {
    
    var elements: [T]
    
    init (_ first: T, _ second: T) {
        elements = [first, second]
    }
    
    init(array: DisjunctiveComparisonArray<T>, element: T) {
        elements = array.elements + [element]
    }
}

public func || <T>(left: T, right: T) -> DisjunctiveComparisonArray<T> {
    return DisjunctiveComparisonArray(left, right)
}

public func || <T>(left: DisjunctiveComparisonArray<T>, right: T) -> DisjunctiveComparisonArray<T> {
    return DisjunctiveComparisonArray(array: left, element: right)
}

public func == <T>(left: T, right: DisjunctiveComparisonArray<T>) -> Bool {
    return right.elements.contains(left)
}

public func == <T>(left: DisjunctiveComparisonArray<T>, right: T) -> Bool {
    for e in left.elements {
        if right == e {
            return true
        }
    }
    return false
}
