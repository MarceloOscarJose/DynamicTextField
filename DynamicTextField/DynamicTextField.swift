//
//  DynamicTextField.swift
//  TrastornoBipolar
//
//  Created by Marcelo Oscar José on 10/31/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class DynamicTextField {

    private var registeredFields:[DynamicTextFieldDelegate] = []
    private var fieldError: String?

    func getFieldError() -> String {
        return self.fieldError!
    }

    func registerField(field: DynamicTextFieldDelegate, maxLength: Int?, entryType: String?, validationRules: [DynamicTextFieldRule]?, maskText: String?) {

        if let max = maxLength {
            field.setMaxLength(max: max)
        }
        if let entry = entryType {
            field.setEntryType(entry: entry)
        }
        if let validations = validationRules {
            field.setValidationRules(rules: validations)
        }
        if let mask = maskText {
            field.setMask(mask: mask)
        }

        registeredFields.append(field)
    }

    func validateFields() -> Bool{
        for field in registeredFields {
            if !field.isValid() {
                self.fieldError = field.getFieldError()
                return false
            }
        }

        return true
    }
}
