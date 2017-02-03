//
//  Optional.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 2/3/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import Foundation

public protocol Emptiable {
    var isEmpty: Bool { get }
}
extension String: Emptiable {}

// Extension for optional strings that provides the `isNilOrEmpty` property.
public extension Optional where Wrapped: Emptiable {
    /// `true` if `self == nil` or `self?.isEmpty == true`, `false` otherwise.
    ///
    /// Available for optional strings. If you want it for other type make it conform to the `Emptiable` protocol.
    var isNilOrEmpty: Bool {
        switch self {
        case .none: return true
        case .some(let string): return string.isEmpty
        }
    }
}
