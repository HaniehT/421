//
//  DiceGame421Tests.swift
//  DiceGame421Tests
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import XCTest
@testable import DiceGame421

class DiceGame421Tests: XCTestCase {

    // MARK: DICE
    func testDiceHasSixFaces() {
        let dice = Dice()
        XCTAssertEqual(6, dice.face)
    }
    
    func testDiceIsaOneByDefault() {
        let dice = Dice()
        XCTAssertEqual(1, dice.value)
    }
    
    func testDiceWithDefaultValue() {
        let dice = Dice(withValue: 3)
        XCTAssertEqual(3, dice.value)
    }
    
    func testDiceRollBetweenOneandSix() {
        var dice = Dice()
        var repartition = [0, 0, 0, 0, 0, 0]
        for _ in (1...10000) {
            dice.roll()
            repartition[dice.value - 1] += 1
            XCTAssertGreaterThan(dice.value, 0)
            XCTAssertLessThan(dice.value, 7)
        }
        print(repartition)
    }
    
    // MARK: PLAYER
    func testPlayerHasaName() {
        let player = Player(name: "Nicolas")
        XCTAssertEqual("Nicolas", player.name)
    }
    
    // MARK: GAME
    func testGameStartWith15TokensToDistribute() {
        let game = Game()
        XCTAssertEqual(15, game.tokenToDistribute)
    }
    
    func testGameStartWith0TokenForPlayers() {
        let game = Game()
        XCTAssertEqual(2, game.numberOfPlayer)
        XCTAssertEqual(0, game.tokenPlayers[0])
        XCTAssertEqual(0, game.tokenPlayers[1])
    }
    
    func testGameStartWith0TokenForMultiplePlayers() {
        let game = Game(numberOfPlayer: 5)
        XCTAssertEqual(5, game.numberOfPlayer)
        XCTAssertEqual(0, game.tokenPlayers[0])
        XCTAssertEqual(0, game.tokenPlayers[1])
        XCTAssertEqual(0, game.tokenPlayers[2])
        XCTAssertEqual(0, game.tokenPlayers[3])
        XCTAssertEqual(0, game.tokenPlayers[4])
    }
    
    // MARK: COMBINATION
    func testSortAllCombinations() {
        var combinationNotSorted = [Combination]()
        combinationNotSorted.append(CombinationName.c221.getCombination())
        combinationNotSorted.append(CombinationName.c123.getCombination())
        combinationNotSorted.append(CombinationName.c234.getCombination())
        combinationNotSorted.append(CombinationName.c345.getCombination())
        combinationNotSorted.append(CombinationName.c456.getCombination())
        combinationNotSorted.append(CombinationName.c222.getCombination())
        combinationNotSorted.append(CombinationName.c112.getCombination())
        combinationNotSorted.append(CombinationName.c333.getCombination())
        combinationNotSorted.append(CombinationName.c113.getCombination())
        combinationNotSorted.append(CombinationName.c444.getCombination())
        combinationNotSorted.append(CombinationName.c114.getCombination())
        combinationNotSorted.append(CombinationName.c555.getCombination())
        combinationNotSorted.append(CombinationName.c115.getCombination())
        combinationNotSorted.append(CombinationName.c666.getCombination())
        combinationNotSorted.append(CombinationName.c116.getCombination())
        combinationNotSorted.append(CombinationName.c111.getCombination())
        combinationNotSorted.append(CombinationName.c421.getCombination())
        
        // no combination
        combinationNotSorted.append(Combination(one: 6, two: 5, three: 2))
        combinationNotSorted.append(Combination(one: 3, two: 1, three: 3))
        combinationNotSorted.append(Combination(one: 4, two: 3, three: 1))
        combinationNotSorted.append(Combination(one: 1, two: 5, three: 6))
        combinationNotSorted.append(Combination(one: 5, two: 2, three: 4))
        combinationNotSorted.append(Combination(one: 1, two: 4, three: 5))
        
        for _ in (1...2000) {
            
            combinationNotSorted.shuffle()
            let combinationSorted = Array(combinationNotSorted.sorted().reversed())
            
            XCTAssertEqual(CombinationName.c421.getCombination(), combinationSorted[0])
            XCTAssertEqual(CombinationName.c111.getCombination(), combinationSorted[1])
            XCTAssertEqual(CombinationName.c116.getCombination(), combinationSorted[2])
            XCTAssertEqual(CombinationName.c666.getCombination(), combinationSorted[3])
            XCTAssertEqual(CombinationName.c115.getCombination(), combinationSorted[4])
            XCTAssertEqual(CombinationName.c555.getCombination(), combinationSorted[5])
            XCTAssertEqual(CombinationName.c114.getCombination(), combinationSorted[6])
            XCTAssertEqual(CombinationName.c444.getCombination(), combinationSorted[7])
            XCTAssertEqual(CombinationName.c113.getCombination(), combinationSorted[8])
            XCTAssertEqual(CombinationName.c333.getCombination(), combinationSorted[9])
            XCTAssertEqual(CombinationName.c112.getCombination(), combinationSorted[10])
            XCTAssertEqual(CombinationName.c222.getCombination(), combinationSorted[11])
            XCTAssertEqual(CombinationName.c456.getCombination(), combinationSorted[12])
            XCTAssertEqual(CombinationName.c345.getCombination(), combinationSorted[13])
            XCTAssertEqual(CombinationName.c234.getCombination(), combinationSorted[14])
            XCTAssertEqual(CombinationName.c123.getCombination(), combinationSorted[15])
            XCTAssertEqual(CombinationName.c221.getCombination(), combinationSorted[16])
            XCTAssertEqual(Combination(one: 6, two: 5, three: 2), combinationSorted[17])
            XCTAssertEqual(Combination(one: 1, two: 5, three: 6), combinationSorted[18])
            XCTAssertEqual(Combination(one: 5, two: 2, three: 4), combinationSorted[19])
            XCTAssertEqual(Combination(one: 1, two: 4, three: 5), combinationSorted[20])
            XCTAssertEqual(Combination(one: 4, two: 3, three: 1), combinationSorted[21])
            XCTAssertEqual(Combination(one: 3, two: 1, three: 3), combinationSorted[22])
        }
        
    }
}
