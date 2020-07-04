//
//  Dice.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

struct Dice {
    let face = 6
    var value = 1
    
    init(withValue: Int = 1) {
        value = withValue
    }
    
    mutating func roll() {
        value = Int.random(in: 1...face)
    }
}
