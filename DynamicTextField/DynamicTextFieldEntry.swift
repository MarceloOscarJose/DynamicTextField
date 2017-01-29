//
//  DynamicTextFieldEntry.swift
//  TrastornoBipolar
//
//  Created by Marcelo Oscar José on 10/27/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

class DynamicTextFieldEntry {

    static let Numeric: String       = "^[0-9]?$"
    static let Alpha: String         = "^[a-z A-Z]?$"
    static let AlphNumeric: String   = "^[a-z A-Z0-9]?$"
    static let Default: String       = "^.$"

    public var type: String

    init(type: String) {
        self.type = type
    }
}
