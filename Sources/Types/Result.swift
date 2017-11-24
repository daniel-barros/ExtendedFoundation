//
//  Result.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 23/1/17.
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

/// Convenient type for using with completion handlers in functions that may fail with an error.
public enum TypedResult<Value, ErrorType> where ErrorType: Error {
    case success(Value)
    case failure(ErrorType)
    
    /// `true` if `.success`, false otherwise.
    public var isSuccessful: Bool {
        return value != nil
    }
    
    /// The associated value if `.success`, nil otherwise.
    public var value: Value? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    
    /// The associated error if `.failure`, nil otherwise.
    public var error: ErrorType? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

/// Convenient type for using with completion handlers in functions that may fail with an optional error.
public enum Result<Value> {
    case success(Value)
    case failure(Error?)
    
    /// `true` if `.success`, false otherwise.
    public var isSuccessful: Bool {
        return value != nil
    }
    
    /// The associated value if `.success`, nil otherwise.
    public var value: Value? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    
    /// The associated error if `.failure`, nil otherwise.
    public var error: Error? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}

/// Convenient type for using with completion handlers in asynchronous functions that either succeed or fail, the latter with an optional error.
public enum BooleanResult<ErrorType> where ErrorType: Error {
    case success
    case failure(ErrorType?)
    
    /// `true` if `.success`, false otherwise.
    public var isSuccessful: Bool {
        if case .success = self { return true }
        return false
    }
    
    /// The associated error if `.failure`, nil otherwise.
    public var error: ErrorType? {
        if case let .failure(error) = self { return error }
        return nil
    }
}
