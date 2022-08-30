//
//  InstructionsViewController.swift
//  TextFieldsChallenge
//
//  Created by Mauricio Paternina on 29/08/22.
//

import UIKit

class InstructionsViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var instructionsText: UITextView!
  @IBOutlet weak var goBackButton: UIButton!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    instructionsText.isEditable = false
  }
  
  // MARK: Actions
  @IBAction private func closeModal() {
    dismiss(animated: true, completion: nil)
  }
  
}
