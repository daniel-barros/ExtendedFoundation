//
//  Array.swift
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

public extension Array {
    
    var second: Element? {
        return self[safe: 1]
    }
    
    var third: Element? {
        return self[safe: 2]
    }
    
    var fourth: Element? {
        return self[safe: 3]
    }
    
    subscript(safe index: Int) -> Element? {
        return count >= index ? self[index] : nil
    }
    
    /// Shuffles the elements of `self` in-place.
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            self.swapAt(i, j)
        }
    }
    
    /// - returns: A copy of `self` with its elements shuffled.
    func shuffled() -> [Element] {
        var list = self
        list.shuffle()
        return list
    }
}
