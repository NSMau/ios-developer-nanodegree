//
//  ColorizerTextFieldDelegate.swift
//  TextFields
//
//  Created by Mauricio Paternina on 29/08/22.
//

import Foundation
import UIKit

class ColorizerTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  // MARK: Properties
  let colors: [String : UIColor] = [
    "black":   UIColor.black,
    "blue":    UIColor.blue,
    "brown":   UIColor.brown,
    "cyan" :   UIColor.cyan,
    "green":   UIColor.green,
    "magenta": UIColor.magenta,
    "orange":  UIColor.orange,
    "purple":  UIColor.purple,
    "red":     UIColor.red,
    "white":   UIColor.white,
    "yellow":  UIColor.yellow
  ]
  
  ///
  /// Check the new string whenever the text changes. Look for worded colors, blend them, and set the text color
  /// @return `Bool`
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    var colorsInTheText = [UIColor]()
    
    // Construct the newText if this change is accepeted
    var newText = textField.text! as NSString
    
    newText = newText.replacingCharacters(in: range, with: string) as NSString
    
    // For each entry in the colors dictionary, pull out a word to search for
    // and append it to the colorsInTheText array
    for (key, color) in colors {
      
      if newText.range(of: key, options: .caseInsensitive).location != NSNotFound {
        colorsInTheText.append(color)
      }
      
    }
    
    // If we found any colors, blend them and set the text color
    if colorsInTheText.count > 0 {
      textField.textColor = self.blendColorsArray(colorsInTheText)
    }
    
    return true
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  ///
  /// `blendColorsArray`
  /// Accepts an array of colors, blends them into a single color, and returns it
  func blendColorsArray(_ colors: [UIColor]) -> UIColor {
    var colorComponents: [CGFloat] = [CGFloat](repeating: 0.0, count: 4)
    
    for color in colors {
      var red: CGFloat = 0
      var green: CGFloat = 0
      var blue: CGFloat = 0
      var alpha: CGFloat = 0
      
      color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
      
      colorComponents[0] += red
      colorComponents[1] += green
      colorComponents[2] += blue
      colorComponents[3] += alpha
    }
    
    for i in 0...colorComponents.count - 1 {
      colorComponents[i] /= CGFloat(colors.count)
    }
    
    return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
  }
  
}
