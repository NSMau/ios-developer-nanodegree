//
//  MemeTextFieldDelegate.swift
//  MemeMe
//
//  Created by Mauricio Paternina on 31/08/22.
//

import UIKit

class MemeTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    true
  }
  
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    
    if (
      textField.text!.lowercased() == AppModel.topTextFieldPlaceholder.lowercased()
      || textField.text!.lowercased() == AppModel.bottomTextFieldPlaceholder.lowercased()
    ) {
      textField.text! = ""
    }
    
  }
  
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    textField.defaultTextAttributes = AppModel.textFieldDefaultTextAttributes
    
    if textField.text == "" {
      
      textField.text = textField.tag == 0
        ? AppModel.topTextFieldPlaceholder : AppModel.bottomTextFieldPlaceholder
      
    } else {
      textField.text = textField.text!
    }
    
  }
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
}
