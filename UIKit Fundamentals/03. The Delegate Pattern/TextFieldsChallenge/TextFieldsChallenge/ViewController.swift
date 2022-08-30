//
//  ViewController.swift
//  TextFieldsChallenge
//
//  Created by Mauricio Paternina on 29/08/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Outlets
  @IBOutlet weak var zipCodeTextField: UITextField!
  @IBOutlet weak var currencyTextField: UITextField!
  @IBOutlet weak var toggableTextField: UITextField!
  @IBOutlet weak var toggableTextFieldSwitch: UISwitch!
  @IBOutlet weak var instructionsLink: UIButton!
  
  // Text fields' delegate objects
  let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
  let currencyTextFieldDelegate = CurrencyTextFieldDelegate()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set delegates
    self.zipCodeTextField.delegate = zipCodeTextFieldDelegate
    self.currencyTextField.delegate = currencyTextFieldDelegate
    self.toggableTextField.delegate = self
    
    // Turn switch off on load
    self.toggableTextFieldSwitch.setOn(false, animated: false)
  }
  
  // MARK: Text Field Delegate
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    self.toggableTextFieldSwitch.isOn
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  // MARK: Actions
  
  // Toggle editability of the toggableTextField
  @IBAction func toggleToggableTextFieldEditability(_ sender: AnyObject) {
    if !(sender as! UISwitch).isOn {
      self.toggableTextField.resignFirstResponder()
    }
  }
  
  /// Displays a modal with instructions on how the app works
  @IBAction func showInstructionsModal() {
    let instructionsModalViewController = self.storyboard?.instantiateViewController(withIdentifier: "InstructionsViewController") as! InstructionsViewController
    
    present(instructionsModalViewController, animated: true, completion: nil)
  }

}

