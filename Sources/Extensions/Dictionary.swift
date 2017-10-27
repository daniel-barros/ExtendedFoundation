//
//  Dictionary.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 10/27/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /// Returns a new dictionary containing the keys of this dictionary with the
    /// values transformed by the given closure.
    func flatMapValues<T>(_ transform: (Dictionary.Value) throws -> T?) rethrows -> [Dictionary.Key : T] {
        var dict: [Key: T] = [:]
        for (key, value) in self {
            dict[key] = try transform(value)
        }
        return dict
    }
}
