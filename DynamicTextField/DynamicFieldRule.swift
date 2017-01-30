//
//  DynamicTextFieldRules.swift
//  TrastornoBipolar
//
//  Created by Marcelo Oscar José on 10/27/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

open class DynamicFieldRule {
    
    public static let Email          = "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
    public static let ZipCode        = "^[0-9]{5}(-[0-9]{4})?$"
    public static let Numbers        = "^.*?[0-9].*?$"
    public static let Alpha          = "^.*?[a-zA-Z].*?$"
    public static let AlphNumeric    = "^.*?[a-zA-Z0-9].*?$"
    public static let Phone          = "^\\([0-9]{3}\\)[0-9]{3}\\-[0-9]{4}$"
    public static let Required       = "^.{1,}$"

    var regex: String
    var error: String = ""
    
    public init(regex: String, error: String) {
        self.regex = regex
        self.error = error
    }
}
