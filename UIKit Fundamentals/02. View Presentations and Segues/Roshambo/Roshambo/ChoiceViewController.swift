//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by Mauricio Paternina on 26/08/22.
//

import UIKit

class ChoiceViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  
  // MARK: Actions
  
  @IBAction func determineWinner(_ sender: UIButton) {
    let controller = self.storyboard?.instantiateViewController(
      withIdentifier: "GameResultViewController"
    ) as! GameResultViewController
    
    controller.gameResult.playerChoice = getUserChoice(sender)
    
    present(controller, animated: true, completion: nil)
  }
  
  
  // MARK: Utilities
  
  private func getUserChoice(_ sender: UIButton) -> Choice {
    Choice(rawValue: sender.accessibilityLabel!)!
  }

}

