//
//  GameModel.swift
//  Roshambo
//
//  Created by Mauricio Paternina on 6/10/22.
//

import Foundation

// The "Choice" enum represents an option choice by a player/ai
enum Choice: String {
  case Rock = "Rock", Scissors = "Scissors", Paper = "Paper"
  
  // This method randomly selects the ai choice
  static func randomChoice() -> Choice {
    let choices = ["Rock", "Scissors", "Paper"]
    let randomChoice = Int(arc4random_uniform(3))
    
    return Choice(rawValue: choices[randomChoice])!
  }
}

struct GameResult {
  var playerChoice: Choice?
  let aiChoice: Choice = Choice.randomChoice()
  var winner: Winner?
}

enum Winner: String {
  case Player = "Player", AI = "AI", Tie = "Tie"
}

var gameHistory = [GameResult]()
