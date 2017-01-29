//
//  DynamicTextFieldDelegate.swift
//  TrastornoBipolar
//
//  Created by Marcelo Oscar José on 10/26/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class DynamicTextFieldDelegate: UITextField, UITextFieldDelegate {

    // MARK - Properties
    private var maxLength: Int = Int.max
    private var maskText : String?
    private var validationRules: [DynamicTextFieldRule] = []
    private var entryType: String = DynamicTextFieldEntry.Default
    private var fieldError: String = ""

    // MARK - Properties Setters
    func setMaxLength(max: Int) {
        self.maxLength = max
    }
    func setMask(mask: String) {
        self.maskText = mask
    }
    func setEntryType(entry: String) {
        self.entryType = entry
    }
    func setValidationRules(rules: [DynamicTextFieldRule]) {
        self.validationRules = rules
    }
    func getFieldError() -> String {
        return self.fieldError
    }

    // MARK - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.delegate = self
    }

    // MARK - Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard string.characters.count > 0 else {
            return true
        }
        
        let currentText = textField.text ?? ""
        let futureText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let mask = maskText ?? ""

        if futureText.characters.count <= self.maxLength {
            if string.range(of: self.entryType, options: .regularExpression) == nil {
                return false
            }
            if mask.characters.count == 0 {
                return true
            }
            if futureText.characters.count > mask.characters.count {
                return false
            } else {
                let maskValue = mask[mask.index(mask.startIndex, offsetBy: (futureText.characters.count-1))]
                
                switch maskValue {
                case "d": return string.range(of: DynamicTextFieldEntry.Numeric, options: .regularExpression) != nil
                case "s": return string.range(of: DynamicTextFieldEntry.Alpha, options: .regularExpression) != nil
                case "*": return true
                default:
                    textField.text = textField.text! + String(maskValue)
                    return self.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
                }
                
            }
        }
        
        return false
    }

    // MARK - Private
    func isValid() -> Bool {

        let text = self.text ?? ""
        var result = false

        for rule in self.validationRules {
            
            let regex = try? NSRegularExpression(pattern: rule.regex, options: .caseInsensitive)
            result = regex?.firstMatch(in: self.text!, options: [], range: NSMakeRange(0, text.characters.count)) != nil

            if result == false {
                self.toggleError(error: rule.error, show: true)
                break
            }
        }

        if result {
            self.toggleError(error: "", show: false)
        }
        
        return result
    }

    func toggleError(error: String, show: Bool) {

        self.fieldError = error
        if show {
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.red.cgColor
        } else {
            self.layer.borderWidth = 0
            self.layer.borderColor = UIColor.clear.cgColor
        }
    }
}

/*
 class CurrencyFormatter : NumberFormatter, FormatterProtocol {
 override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, range rangep: UnsafeMutablePointer<NSRange>?) throws {
 guard obj != nil else { return }
 let str = string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
 obj?.pointee = NSNumber(value: (Double(str) ?? 0.0)/Double(pow(10.0, Double(minimumFractionDigits))))
 }
 
 func getNewPosition(forPosition position: UITextPosition, inTextInput textInput: UITextInput, oldValue: String?, newValue: String?) -> UITextPosition {
 return textInput.position(from: position, offset:((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))) ?? position
 }
 }*/
