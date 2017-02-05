//
//  Sequence.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 2/5/17.
//
//  Copyright (c) 2017 Daniel Barros López
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

public extension Sequence {
    /// Groups the elements in the sequence and returns a dictionary with groups as keys and arrays of elements as values.
    /// - parameter groupOf: A closure used to get the group for an element in the sequence.
    func grouped<T>(_ groupOf: (Self.Iterator.Element) throws -> T) rethrows -> [T: [Self.Iterator.Element]] where T: Hashable {
        var dict: [T: [Iterator.Element]] = [:]
        for e in self {
            let group = try groupOf(e)
            if dict[group] == nil {
                dict[group] = []
            }
            dict[group]?.append(e)
        }
        return dict
    }
}
