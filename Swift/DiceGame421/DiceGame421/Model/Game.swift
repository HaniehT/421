//
//  Game.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

class Game {
    
    private let maxPossibleRollPhaseTwo = 3
    
    var tokenToDistribute = 15
    var tokenPlayers: [Int]
    
    var numberOfPlayer: Int
    
    var players: [Player]
    var playerPlaying = 0
    
    var phase: Phase
    
    private(set) var turnCombination = [Combination]()
    
    private var rollByPlayer: [Int]
    
    init(players: [Player]) {
        self.numberOfPlayer = players.count
        self.players = players
        self.phase = Phase.phase1
        self.tokenPlayers = Array(repeating: 0, count: numberOfPlayer)
        self.rollByPlayer = Array(repeating: 0, count: numberOfPlayer)
    }
    
    func play() {
        
        if phase == Phase.phase1 {
            if turnCombination.count == numberOfPlayer {
                turnCombination.removeAll()
            }
            
            turnCombination.append(generateCombination())
            
            if turnCombination.count == numberOfPlayer {
                endTurn()
            }
        }
        
        if phase == Phase.phase2 {
            rollByPlayer[playerPlaying] += 1
            
            if rollByPlayer[playerPlaying] == maxPossibleRollPhaseTwo {
                turnCombination.append(generateCombination())
                changePlayer()
                
                if turnCombination.count == numberOfPlayer {
                    endTurn()
                }
            }
        }
    }
    
    private func generateCombination() -> Combination {
        
        var dice = Dice()
        dice.roll()
        let valueOne = dice.value
        dice.roll()
        let valueTwo = dice.value
        dice.roll()
        let valueThree = dice.value
        
        return Combination(one: valueOne, two: valueTwo, three: valueThree)
    }
    
    private func changePlayer() {
        playerPlaying += 1
        if playerPlaying == numberOfPlayer {
            playerPlaying = 0
        }
    }
    
    private func endTurn() {
        if phase == Phase.phase1 {
            endTurnPhaseOne()
        }
        if phase == Phase.phase2 {
            endTurnPhaseTwo()
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
    
    private func endTurnPhaseTwo() {
        print(turnCombination)
        let points = min(calculatePointForTheTurn(), tokenPlayers.max()!)
    
        // find index min combination
        let combinationMin = turnCombination.min()!
        let indexMin = turnCombination.firstIndex(of: combinationMin)!
        
        // Find index mac combination
        let combinationMax = turnCombination.max()!
        let indexMax = turnCombination.firstIndex(of: combinationMax)!
        
        // Add token to Player Min
        tokenPlayers[indexMin] += points
        
        //Remove token to Player max
        tokenPlayers[indexMax] -= points

    }
    
    private func calculatePointForTheTurn() -> Int {
        return max(turnCombination.map({$0.knownCombination?.getPoints() ?? 0}).reduce(0, +), 1)
    }
}
