//
//  InstructionsViewController.swift
//  TextFields
//
//  Created by Mauricio Paternina on 29/08/22.
//

import UIKit

class InstructionsViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var goBackButton: UIButton!
  @IBOutlet weak var instructionsText: UITextView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    instructionsText.isEditable = false
  }
  
  // MARK: Actions
  @IBAction private func goBack() {
    dismiss(animated: true, completion: nil)
  }
}
