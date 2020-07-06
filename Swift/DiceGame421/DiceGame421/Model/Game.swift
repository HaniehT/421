//
//  Game.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

class Game {
    var tokenToDistribute = 15
    var tokenPlayers: [Int]
    
    var numberOfPlayer: Int
    
    var players: [Player]
    var playerToPlay = 0
    
    var phase: Phase
    
    private(set) var turnCombination = [Combination]()
    
    init(players: [Player]) {
        self.numberOfPlayer = players.count
        self.players = players
        self.phase = Phase.phase1
        tokenPlayers = Array(repeating: 0, count: numberOfPlayer)
    }
    
    func play() {
        
        if turnCombination.count == numberOfPlayer {
            turnCombination.removeAll()
        }
        
        var dice = Dice()
        dice.roll()
        let valueOne = dice.value
        dice.roll()
        let valueTwo = dice.value
        dice.roll()
        let valueThree = dice.value
        
        let combination = Combination(one: valueOne, two: valueTwo, three: valueThree)
     
        turnCombination.append(combination)
        
        if turnCombination.count == numberOfPlayer {
            endTurn()
        }
    }
    
    private func endTurn() {
        if phase == Phase.phase1 {
            endTurnPhaseOne()
        }
    }
    
    private func endTurnPhaseOne() {
        let points = min(calculatePointForTheTurn(), tokenToDistribute)
    
        // find index small combination
        let combinationMin = turnCombination.min()!
        let indexMin = turnCombination.firstIndex(of: combinationMin)!
        
        // Add token to Player
        tokenPlayers[indexMin] += points
        
        // Next Phase
        tokenToDistribute -= points
        if tokenToDistribute == 0 {
            phase = Phase.phase2
        }
         
    }
    
    private func calculatePointForTheTurn() -> Int {
        return max(turnCombination.map({$0.knownCombination?.getPoints() ?? 0}).reduce(0, +), 1)
    }
}
