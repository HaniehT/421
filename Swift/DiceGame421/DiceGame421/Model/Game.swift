//
//  Game.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

struct Game {
    var tokenToDistribute = 15
    var tokenPlayers: [Int]
    
    var numberOfPlayer: Int
    
    init(numberOfPlayer: Int  = 2) {
        self.numberOfPlayer = numberOfPlayer
        tokenPlayers = Array(repeating: 0, count: numberOfPlayer)
    }
    
}
