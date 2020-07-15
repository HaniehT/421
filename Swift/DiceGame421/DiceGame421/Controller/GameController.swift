//
//  GameController.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-10.
//

import Foundation

class GameController: ObservableObject {
    
    private var game: Game
    
    @Published var tokenPlayer0 = 0
    @Published var tokenPlayer1 = 0
    
    @Published var tokenToDistribute = 15
    
    @Published var playerPlayingName = "Richard"
    
    @Published var combimation: Combination?
    
    @Published var phase = 1
    
    @Published var endGame = false
        
    init() {
        game = Game(players: [Player(name: "Richard"), Player(name: "Nicolas")])
    }

    func play() {
        game.play()
        update()
    }
    
    func keepNumber(position: Int) {
        game.keepNumber(numbers: [game.lastlaunch.values[position]])
    }
    
    func stopRoll() {
        game.stopRoll()
        update()
    }
    
    private func update() {
        //combimation = game.turnCombination.last
        combimation = game.lastlaunch
        tokenPlayer0 = game.tokenPlayers[0]
        tokenPlayer1 = game.tokenPlayers[1]
        tokenToDistribute = game.tokenToDistribute
        playerPlayingName = game.players[game.playerPlaying].name
        if game.phase == Phase.phase2 {
            phase = 2
        }
        endGame = game.isOver
    }
    
}
