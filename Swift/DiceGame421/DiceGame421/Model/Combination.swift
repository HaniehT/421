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
}

extension Combination: Comparable {
    static func < (first: Combination, second: Combination) -> Bool {
        let sortFirst = Array(first.values.sorted().reversed())
        let firstString = "\(sortFirst[0])\(sortFirst[1])\(sortFirst[2])"
        
        let sortSecond = Array(second.values.sorted().reversed())
        let secondString = "\(sortSecond[0])\(sortSecond[1])\(sortSecond[2])"

        for combination in CombinationName.allCases {
            if firstString == combination.rawValue || secondString == combination.rawValue {
                return !(firstString == combination.rawValue)
            }
        }

        return firstString < secondString
    }
    
}
