//
//  GameHistoryViewController.swift
//  Roshambo
//
//  Created by Mauricio Paternina on 6/10/22.
//

import Foundation
import UIKit

class GameHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet private weak var historyTableView: UITableView!
  @IBOutlet private weak var playAgainButton: UIButton!
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    gameHistory.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellID = "GameHistoryRecordCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    let record = gameHistory[(indexPath as NSIndexPath).row]
    var content = cell.defaultContentConfiguration()
    
    let winnerMap = ["Player": "Win", "AI": "Loss", "Tie": "Tie"]
    let imageMap = ["Player": "crown", "AI": "multiply", "Tie": "exclamationmark"]
    let imageColorMap: [String:UIColor] = ["Player": .green, "AI": .red, "Tie": .yellow ]
    
    content.text = winnerMap[record.winner!.rawValue]
    content.secondaryText = "\(record.playerChoice!.rawValue) vs. \(record.aiChoice.rawValue)"
    content.image = UIImage(systemName: imageMap[record.winner!.rawValue]!)
    content.imageProperties.tintColor = imageColorMap[record.winner!.rawValue]
    
    cell.contentConfiguration = content
    
    return cell
  }
  
  @IBAction private func playAgain() {
    dismiss(animated: true, completion: nil)
  }
  
}
