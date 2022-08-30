//
//  EmojifizerTextFieldDelegate.swift
//  TextFields
//
//  Created by Mauricio Paternina on 29/08/22.
//

import Foundation
import UIKit

class EmojifizerTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  // MARK: Properties
  var wordEmojiConversions = [String : String]()
  
  // MARK: Initializer
  override init() {
    super.init()
    
    wordEmojiConversions["heart"] = "\u{0001F496}"
    wordEmojiConversions["fish"] = "\u{E522}"
    wordEmojiConversions["bird"] = "\u{E523}"
    wordEmojiConversions["frog"] = "\u{E531}"
    wordEmojiConversions["bear"] = "\u{E527}"
    wordEmojiConversions["dog"] = "\u{E052}"
    wordEmojiConversions["cat"] = "\u{E04F}"
  }
  
  // MARK: Handling text manipulation
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var anEmojiDidGetReplaced = false
    var emojiStringRange: NSRange
    
    // Construct the text that will be in the text field if this change is accepted
    var newText = textField.text! as NSString
    
    newText = newText.replacingCharacters(in: range, with: string) as NSString
    
    // For each entry in the wordEmojiConversions dictionary, pull out a string to
    // search for and an emoji to replace it with
    for (emojiString, emoji) in wordEmojiConversions {
      
      // Search for all occurances of a key (ie. "dog") and replace with its corresponding emoji (ie. 🐶)
      repeat {
        emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
        
        // Found one
        if emojiStringRange.location != NSNotFound {
          newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
          anEmojiDidGetReplaced = true
        }
      } while emojiStringRange.location != NSNotFound
      
    }
    
    // If we happen to replace an emoji, then we directly edit the text field.
    // Otherwise, we allow the proposed edit.
    if anEmojiDidGetReplaced {
      textField.text = newText as String
      
      return false
    } else {
      return true
    }
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.text = ""
  }
  
}
