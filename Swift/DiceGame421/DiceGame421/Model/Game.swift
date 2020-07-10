//
//  Game.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation
import OSLog

class Game {
    private let logger = Logger(subsystem: "421", category: "game")
    private let maxPossibleRollPhaseTwo = 3
    
    var tokenToDistribute = 15
    var tokenPlayers: [Int]
    
    var numberOfPlayer: Int
    
    var players: [Player]
    var playerPlaying = 0
    
    var phase: Phase
    
    private(set) var turnCombination = [Combination]()
    
    private var rollByPlayer: [Int]
    private var maxRollForTheTurn = 0
    
    private(set) var isOver = false
    
    init(players: [Player]) {
        self.numberOfPlayer = players.count
        self.players = players
        self.phase = Phase.phase1
        self.tokenPlayers = Array(repeating: 0, count: numberOfPlayer)
        self.rollByPlayer = Array(repeating: 0, count: numberOfPlayer)
    }
    
    func play() {
        
        guard !isOver else {
            return
        }
        
        logger.info("--- Start Play")
        if phase == Phase.phase1 {
            logger.info("--- Phase 1")
            
            if turnCombination.count == numberOfPlayer {
                logger.info("New turn, we remove all previous turn combination")
                turnCombination.removeAll()
            }
            
            turnCombination.append(generateCombination())
            changePlayer()
            if turnCombination.count == numberOfPlayer {
                endTurn()
            }
            
        } else if phase == Phase.phase2 {
            logger.info("--- Phase 2")
            
            if turnCombination.count == numberOfPlayer {
                logger.info("New turn, we remove all previous turn combination")
                turnCombination.removeAll()
            }
            
            rollByPlayer[playerPlaying] += 1
            logger.info("Player is in its \(self.rollByPlayer[self.playerPlaying]) roll")
            
            if playerPlaying == 0 {
                maxRollForTheTurn += 1
                logger.info("set max roll for turn \(self.maxRollForTheTurn)")
            }
            
            if rollByPlayer[playerPlaying] == maxPossibleRollPhaseTwo ||
                (playerPlaying != 0 && rollByPlayer[playerPlaying] == maxRollForTheTurn ) {
                
                turnCombination.append(generateCombination())
                changePlayer()
                logger.info("We change Player")
                
                logger.info("Turn combination is \(self.turnCombination)")
                if turnCombination.count == numberOfPlayer {
                    logger.info("We trigger endTurn")
                    endTurn()
                }
            }
        }
    }
    
    func stopRoll() {
        if phase == Phase.phase2 {
            turnCombination.append(generateCombination())
            changePlayer()
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
        } else if phase == Phase.phase2 {
            endTurnPhaseTwo()
        }
    }
    
    private func endTurnPhaseOne() {
        logger.info("End turn Phase 1")
        let points = min(calculatePointForTheTurn(), tokenToDistribute)
        
        logger.info("points in play: \(points)")
    
        // find index small combination
        let combinationMin = turnCombination.min()!
        let indexMin = turnCombination.firstIndex(of: combinationMin)!
        
        logger.info("old score: \(self.tokenPlayers)")
        
        // Add token to Player
        tokenPlayers[indexMin] += points
        
        logger.info("new score: \(self.tokenPlayers)")
                
        // Next Phase
        tokenToDistribute -= points
        if tokenToDistribute == 0 {
            
            //Detect End Game
            if tokenPlayers.contains(0) {
                isOver = true
            }
            
            logger.info("move to Phase 2")
            phase = Phase.phase2
        }
    }
    
    private func endTurnPhaseTwo() {
        logger.info("End turn Phase 2")

        // find index min combination
        let combinationMin = turnCombination.min()!
        let indexMin = turnCombination.firstIndex(of: combinationMin)!
        
        // Find index max combination
        let combinationMax = turnCombination.max()!
        let indexMax = turnCombination.firstIndex(of: combinationMax)!
        
        let points = min(calculatePointForTheTurn(), tokenPlayers[indexMax])
        logger.info("points in play: \(points)")
        
        logger.info("old score: \(self.tokenPlayers)")
        
        // Add token to Player Min
        tokenPlayers[indexMin] += points
        
        //Remove token to Player max
        tokenPlayers[indexMax] -= points
        
        logger.info("new score: \(self.tokenPlayers)")
        
        // Reset number of roll
        maxRollForTheTurn = 0
        self.rollByPlayer = Array(repeating: 0, count: numberOfPlayer)
        
        //Detect End Game
        if tokenPlayers.contains(0) {
            isOver = true
        }
        
    }
    
    private func calculatePointForTheTurn() -> Int {
        return max(turnCombination.map({$0.knownCombination?.getPoints() ?? 0}).reduce(0, +), 1)
    }
}
