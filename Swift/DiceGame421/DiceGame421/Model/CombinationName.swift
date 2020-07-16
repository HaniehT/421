//
//  CombinationName.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import Foundation

enum CombinationName: String, CaseIterable {
    case c421 = "421"
    case c111 = "111"
    case c116 = "611"
    case c666 = "666"
    case c115 = "511"
    case c555 = "555"
    case c114 = "411"
    case c444 = "444"
    case c113 = "311"
    case c333 = "333"
    case c112 = "211"
    case c222 = "222"
    case c456 = "654"
    case c345 = "543"
    case c234 = "432"
    case c123 = "321"
    case c221 = "221"
    
    func getCombination() -> Combination {
        let array = Array(self.rawValue)
        return Combination(one: Int(String(array[0]))!, two: Int(String(array[1]))!, three: Int(String(array[2]))!)
    }
    
    func getPoints() -> Int {
        switch self {
        case .c421:
            return 10
        case .c111:
            return 7
        case .c116, .c666:
            return 6
        case .c115, .c555:
            return 5
        case .c114, .c444:
            return 4
        case .c113, .c333:
            return 3
        case .c112, .c222, .c456, .c345, .c234, .c123, .c221:
            return 2
        }
    }
    
}
