//
//  Collection.swift
//  ExtendedFoundation
//
//  Created by Daniel Barros López on 10/28/17.
//  Copyright © 2017 Daniel Barros. All rights reserved.
//

import Foundation

public extension Collection where Element: Numeric {
    
    func sum() -> Element {
        return reduce(0, +)
    }
}
