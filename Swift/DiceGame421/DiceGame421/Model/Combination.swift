//
//  Combination.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

struct Combination {
    private var values = [Int]()
    
    init(one: Int, two: Int, three: Int) {
        values.append(one)
        values.append(two)
        values.append(three)
    }
    
    var reversedString: String {
        let reversed = Array(values.sorted().reversed())
        return "\(reversed[0])\(reversed[1])\(reversed[2])"
    }
    
    var knownCombination: CombinationName? {
        return CombinationName.allCases.first(where: {$0.rawValue == self.reversedString})
    }
}

extension Combination: Comparable {
    static func < (first: Combination, second: Combination) -> Bool {
        let firstString = first.reversedString
        let secondString = second.reversedString

        for combination in CombinationName.allCases {
            if firstString == combination.rawValue || secondString == combination.rawValue {
                return !(firstString == combination.rawValue)
            }
        }
 
        return firstString < secondString
    }
}
