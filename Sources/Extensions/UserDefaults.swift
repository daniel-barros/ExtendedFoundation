//
//  UserDefaults.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 1/31/17.
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

public extension UserDefaults {
    
    /// Returns the object corresponding to the raw value associated with the specified key, or nil if the raw value wasn't found or the `RawRepresentable` object could not be instantiated from it.
    ///
    /// - note: You'll need to help the compiler infer the expected object's type.
    func rawRepresentableObject<T>(forKey key: String) -> T? where T: RawRepresentable {
        if let raw = self.object(forKey: key) as? T.RawValue,
            let object = T(rawValue: raw) {
            return object
        } else {
            return nil
        }
    }
}
