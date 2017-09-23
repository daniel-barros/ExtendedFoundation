//
//  Optional.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 2/3/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import Foundation

// Extension for optional strings that declares the `isNilOrEmpty` property.
public extension Optional where Wrapped == String {
    /// `true` if `self == nil` or `self?.isEmpty == true`, `false` otherwise.
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
