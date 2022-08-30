//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldsChallenge
//
//  Created by Mauricio Paternina on 29/08/22.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var newText = textField.text! as NSString
    
    newText = newText.replacingCharacters(in: range, with: string) as NSString
    
    // Limit newText.length to 5 characters
    return newText.length <= 5
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
}
