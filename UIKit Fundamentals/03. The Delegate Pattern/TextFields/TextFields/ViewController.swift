//
//  ViewController.swift
//  TextFields
//
//  Created by Mauricio Paternina on 29/08/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Outlets
  @IBOutlet weak var emojifizerTextField: UITextField!
  @IBOutlet weak var colorizerTextField: UITextField!
  @IBOutlet weak var characterCounterTextField: UITextField!
  @IBOutlet weak var characterCounterTextLabel: UILabel!
  @IBOutlet weak var instructionsLink: UIButton!
  
  // MARK: TextFields' Delegate Objects
  let emojifizerTextFieldDelegate = EmojifizerTextFieldDelegate()
  let colorizerTextFieldDelegate = ColorizerTextFieldDelegate()
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Hide the caractherCounterTextLabel at start
    characterCounterTextLabel.isHidden = true
    
    // Set delegates
    self.emojifizerTextField.delegate = emojifizerTextFieldDelegate
    self.colorizerTextField.delegate = colorizerTextFieldDelegate
    self.characterCounterTextField.delegate = self
  }
  
  // MARK: TextField's Delegate Methods
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    // Figure out what the new text will be if we return true
    var newText = textField.text! as NSString
    
    newText = newText.replacingCharacters(in: range, with: string) as NSString
    
    // Hide the label if newText is an empty string
    characterCounterTextLabel.isHidden = (newText.length == 0)
    
    // Write the length of newText into the label
    characterCounterTextLabel.text = String(newText.length)
    
    // Return true to give the input field permission to change its text
    return true
    
  }
  
  /// Display a modal with instructions on how the app works
  @IBAction func showInstructions() {
    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "InstructionsViewController") as! InstructionsViewController
    
    present(viewController, animated: true, completion: nil)
  }


}

