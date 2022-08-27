//
//  GameResultViewController.swift
//  Roshambo
//
//  Created by Mauricio Paternina on 26/08/22.
//

import UIKit

// The "Choice" enum represents an option choice by a player/ai
enum Choice: String {
  case Rock = "Rock"
  case Scissors = "Scissors"
  case Paper = "Paper"
  
  // This method randomly selects the ai choice
  static func randomChoice() -> Choice {
    let choices = ["Rock", "Scissors", "Paper"]
    let randomChoice = Int(arc4random_uniform(3))
    
    return Choice(rawValue: choices[randomChoice])!
  }
}

class GameResultViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet private weak var gameResultImage: UIImageView!
  @IBOutlet private weak var gameResultMessage: UITextView!
  
  // MARK: Properties
  
  var playerChoice: Choice?
  private var aiChoice: Choice = Choice.randomChoice()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    gameResultMessage.isEditable = false
    
    displayGameResult()
  }
  
  // MARK: UI
  
  /// The displayGameResult function determines the image and message to be shown upon calculating the result of a game
  private func displayGameResult() {
    var imageName: String
    var message: String
    
    switch (playerChoice!, aiChoice) {
      case (.Rock, .Scissors):
        imageName = "rock-wins"
        message = """
        Rock crushes Scissors!
        You win!
        """
      case (.Scissors, .Paper):
        imageName = "scissors-win"
        message = """
        Scissors cut Paper!
        You win!
        """
      case (.Paper, .Rock):
        imageName = "paper-wins"
        message = """
        Paper wraps Rock!
        You win!
        """
      case (.Scissors, .Rock):
        imageName = "rock-wins"
        message = """
        Rock crushes Scissors!
        You lose!
        """
      case (.Paper, .Scissors):
        imageName = "scissors-win"
        message = """
        Scissors cut Paper!
        You lose!
        """
      case (.Rock, .Paper):
        imageName = "paper-wins"
        message = """
        Paper wraps Rock!
        You lose!
        """
      default:
        imageName = "rock-wins"
        message = """
        It's a tie, people!
        Nobody wins!
        """
    }
    
    gameResultImage.image = UIImage(named: imageName)
    gameResultMessage.text = message
  }
  
  // MARK: Actions
  
  @IBAction private func playAgain() {
    dismiss(animated: true, completion: nil)
  }
  
  
}
