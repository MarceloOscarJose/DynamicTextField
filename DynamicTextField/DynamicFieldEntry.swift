//
//  DynamicTextFieldEntry.swift
//  TrastornoBipolar
//
//  Created by Marcelo Oscar José on 10/27/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

open class DynamicFieldEntry {

    public static let Numeric: String       = "^[0-9]?$"
    public static let Alpha: String         = "^[a-z A-Z]?$"
    public static let AlphNumeric: String   = "^[a-z A-Z0-9]?$"
    public static let Default: String       = "^.$"

    public var type: String

    public init(type: String) {
        self.type = type
    }
}
