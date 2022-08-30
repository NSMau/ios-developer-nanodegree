//
//  CurrencyTextFieldDelegate.swift
//  TextFieldsChallenge
//
//  Created by Mauricio Paternina on 29/08/22.
//

import Foundation
import UIKit

class CurrencyTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text! as NSString
    var newText = oldText.replacingCharacters(in: range, with: string)
    let newTextString = String(newText)
    
    let digits = CharacterSet.decimalDigits
    var digitText = ""
    
    for char in newTextString.unicodeScalars {
      if digits.contains(UnicodeScalar(char.value)!) {
        digitText.append("\(char)")
      }
    }
    
    // Format newText
    if let pennies = Int(digitText) {
      newText = "$\(self.dollarsStringFromInt(pennies)).\(self.centsStringFromInt(pennies))"
    } else {
      newText = "$0.00"
    }
    
    textField.text = newText
    
    return false
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField.text!.isEmpty {
      textField.text = "$0.00"
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  // MARK: Utilities
  func dollarsStringFromInt(_ value: Int) -> String {
    String(value / 100)
  }
  
  func centsStringFromInt(_ value: Int) -> String {
    let cents = value % 100
    var centsString = String(cents)
    
    if cents < 10 {
      centsString = "0\(centsString)"
    }
    
    return centsString
  }
  
}
