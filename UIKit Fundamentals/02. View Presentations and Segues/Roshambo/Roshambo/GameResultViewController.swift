//
//  GameResultViewController.swift
//  Roshambo
//
//  Created by Mauricio Paternina on 26/08/22.
//

import UIKit

class GameResultViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet private weak var gameResultImage: UIImageView!
  @IBOutlet private weak var gameResultMessage: UITextView!
  @IBOutlet private weak var playAgainButton: UIButton!
  @IBOutlet private weak var viewHistoryButton: UIButton!
  
  // MARK: Properties
  var gameResult = GameResult()
  
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
    
    switch (gameResult.playerChoice!, gameResult.aiChoice) {
      case (.Rock, .Scissors):
        gameResult.winner = Winner.Player
        imageName = "rock-wins"
        message = """
        Rock crushes Scissors!
        You win!
        """
      case (.Scissors, .Paper):
        gameResult.winner = Winner.Player
        imageName = "scissors-win"
        message = """
        Scissors cut Paper!
        You win!
        """
      case (.Paper, .Rock):
        gameResult.winner = Winner.Player
        imageName = "paper-wins"
        message = """
        Paper wraps Rock!
        You win!
        """
      case (.Scissors, .Rock):
        gameResult.winner = Winner.AI
        imageName = "rock-wins"
        message = """
        Rock crushes Scissors!
        You lose!
        """
      case (.Paper, .Scissors):
        gameResult.winner = Winner.AI
        imageName = "scissors-win"
        message = """
        Scissors cut Paper!
        You lose!
        """
      case (.Rock, .Paper):
        gameResult.winner = Winner.AI
        imageName = "paper-wins"
        message = """
        Paper wraps Rock!
        You lose!
        """
      default:
        gameResult.winner = Winner.Tie
        imageName = "rock-wins"
        message = """
        It's a tie, people!
        Nobody wins!
        """
    }
    
    gameResultImage.image = UIImage(named: imageName)
    gameResultMessage.text = message
    
    gameHistory.append(gameResult)
  }
  
  // MARK: Actions
  
  @IBAction private func playAgain() {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func showGameHistory(_ sender: UIButton) {
    let controller = self.storyboard?.instantiateViewController(
      withIdentifier: "GameHistoryViewController"
    ) as! GameHistoryViewController
      
    present(controller, animated: true, completion: nil)
  }
  
  
}
