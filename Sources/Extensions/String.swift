//
//  String.swift
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

public extension String {
    
    func prepending(_ aString: String) -> String {
        return aString + self
    }
    
    /// Number of characters considering composed characters (like skin-colored emojis) as single characters.
    var composedCount : Int {
        var count = 0
        enumerateSubstrings(in: startIndex..<endIndex, options: .byComposedCharacterSequences) { _ in count += 1}
        return count
    }
    
    /// Returns a new string containing the characters of the `String` that lie within a given range.
    subscript(range: Range<Int>) -> String {
        let i1 = self.index(self.startIndex, offsetBy: range.lowerBound)
        let i2 = self.index(self.startIndex, offsetBy: range.upperBound)
        return self.substring(with: i1..<i2)
    }
    
    /// Returns a new string containing the characters of the `String` that lie within a given range.
    ///
    /// If the upper bound of the range is `Int.max` (almost certainly result of creating a range with the custom `...` postfix operator) the characters taken are those from the one at the lower bound to the end.
    subscript(range: ClosedRange<Int>) -> String {
        let i1 = self.index(self.startIndex, offsetBy: range.lowerBound)
        if range.upperBound == .max {
            return self.substring(from: i1)
        }
        let i2 = self.index(self.startIndex, offsetBy: range.upperBound + 1)
        return self.substring(with: i1..<i2)
    }
    
    /// Returns the character at the start index advanced by the given `Int`.
    subscript(index: Int) -> Character {
        let i = self.index(self.startIndex, offsetBy: index)
        return self[i]
    }
}
