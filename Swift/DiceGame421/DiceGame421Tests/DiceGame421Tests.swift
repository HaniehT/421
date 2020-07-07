//
//  DiceGame421Tests.swift
//  DiceGame421Tests
//
//  Created by Nicolas Savoini on 2020-07-04.
//

import XCTest
@testable import DiceGame421

class DiceGame421Tests: XCTestCase {

    let players = [Player(name: "Player1"), Player(name: "Player2")]
    
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
        let game = Game(players: players)
        XCTAssertEqual(15, game.tokenToDistribute)
    }
    
    func testGameStartWith0TokenForPlayers() {
        let game = Game(players: players)
        XCTAssertEqual(2, game.numberOfPlayer)
        XCTAssertEqual(0, game.tokenPlayers[0])
        XCTAssertEqual(0, game.tokenPlayers[1])
    }
    
    func testGameStartWith0TokenForMultiplePlayers() {
        let players3 = [Player(name: "Player1"), Player(name: "Player2"), Player(name: "Player3")]
        let game = Game(players: players3)
        XCTAssertEqual(3, game.numberOfPlayer)
        XCTAssertEqual(0, game.tokenPlayers[0])
        XCTAssertEqual(0, game.tokenPlayers[1])
        XCTAssertEqual(0, game.tokenPlayers[2])
    }
    
    func testGameStartPlayerToPlayIs0() {
        let game = Game(players: players)
        XCTAssertEqual(0, game.playerPlaying)
    }
    
    // MARK: GAME PHASE 1
    func testGameStartPhaseOne() {
        let game = Game(players: players)
        XCTAssertEqual(Phase.phase1, game.phase)
        
    }
    
    func testGamePhaseOneAllPlayerPlaysTriggerTokenDistribution() {
        let game = Game(players: players)
        game.play()
        game.play()
        XCTAssertLessThan(game.tokenToDistribute, 15)
    }
    
    // TODO - Improve this
    func testGamePhaseOneprint() {
        let game = Game(players: players)
        game.play()
        game.play()
        print(game.turnCombination)
        print(game.players)
        print(game.tokenPlayers)
        print(game.tokenToDistribute)
    }
    
    func testGameFullPhaseOne() {
        let game = Game(players: players)
        
        repeat {
            game.play()
            game.play()
            print(game.turnCombination)
            print(game.players)
            print(game.tokenPlayers)
            print(game.tokenToDistribute)
        } while game.phase == Phase.phase1
        
        XCTAssertEqual(0, game.tokenToDistribute)
        XCTAssertEqual(15, game.tokenPlayers.reduce(0, +))
    }
    
    // MARK: GAME PHASE2
    func testGamePhaseTwoPlayerCanPlayUpToThreeTime() {
        let game = Game(players: players)
        
        //Simulate Phase one result
        game.tokenToDistribute = 0
        game.tokenPlayers = [10, 5]
        game.phase = Phase.phase2
        
        game.play()
        XCTAssertEqual(0, game.playerPlaying)
        game.play()
        XCTAssertEqual(0, game.playerPlaying)
        game.play()
        XCTAssertEqual(1, game.playerPlaying)
        
    }
    
    func testGamePhaseTwoPlayerHasACombinationAfterThreeRoll() {
        let game = Game(players: players)
        
        //Simulate Phase one result
        game.tokenToDistribute = 0
        game.tokenPlayers = [10, 5]
        game.phase = Phase.phase2
        
        game.play()
        game.play()
        game.play()
        XCTAssertFalse(game.turnCombination.isEmpty)
        
    }
    
    func testGamePhaseTwoTokenExchangeAfterThreeRolls() {
        let game = Game(players: players)
        
        //Simulate Phase one result
        game.tokenToDistribute = 0
        game.tokenPlayers = [10, 5]
        game.phase = Phase.phase2
        
        game.play()
        game.play()
        game.play()
        XCTAssertFalse(game.turnCombination.isEmpty)
        XCTAssertEqual(1, game.playerPlaying)
        game.play()
        game.play()
        game.play()
        XCTAssertEqual(0, game.playerPlaying)
        
        XCTAssertNotEqual([10, 5], game.tokenPlayers)
        XCTAssertEqual(15, game.tokenPlayers.reduce(0, +))
        
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
    
    func testCombinationPoint() {
        XCTAssertEqual(10, CombinationName.c421.getPoints())
        
        XCTAssertEqual(7, CombinationName.c111.getPoints())
        
        XCTAssertEqual(6, CombinationName.c116.getPoints())
        XCTAssertEqual(6, CombinationName.c666.getPoints())
        
        XCTAssertEqual(5, CombinationName.c115.getPoints())
        XCTAssertEqual(5, CombinationName.c555.getPoints())
        
        XCTAssertEqual(4, CombinationName.c114.getPoints())
        XCTAssertEqual(4, CombinationName.c444.getPoints())
        
        XCTAssertEqual(3, CombinationName.c113.getPoints())
        XCTAssertEqual(3, CombinationName.c333.getPoints())
        
        XCTAssertEqual(2, CombinationName.c112.getPoints())
        XCTAssertEqual(2, CombinationName.c222.getPoints())
        
        XCTAssertEqual(2, CombinationName.c221.getPoints())
        XCTAssertEqual(2, CombinationName.c123.getPoints())
        XCTAssertEqual(2, CombinationName.c234.getPoints())
        XCTAssertEqual(2, CombinationName.c345.getPoints())
        XCTAssertEqual(2, CombinationName.c456.getPoints())
    }
    
}
