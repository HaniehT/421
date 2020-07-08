//
//  RunningGame.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-08.
//

import SwiftUI

struct RunningGame: View {
    
    @State var game: Game = Game(players: [Player(name: "Richard"), Player(name: "Nicolas")])
    
    @State private var dice = Dice()
    
    var body: some View {
        VStack {

            playerScore
            tokenToDistribute
            
            HStack {
                Text("Player Playing:")
                Spacer()
                Text("\(game.players[game.playerPlaying].name)").padding()
            }
            Divider()
           
            HStack {
                Text("D1")
                
                Text("D2")
                
                Text("\(dice.value)")
                
            }
            Divider()
            
            HStack {
                Spacer()
                Button(action: {
                    game.play()
                    
                }) {
                    Text("Roll")
                }
                Spacer()
                
                //if game.phase == Phase.phase2 {
                Button(action: {dice.roll()}) {
                        Text("Stop")
                    }
                //}
                
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private var playerScore: some View {
        VStack {
            Text("Score")
                .font(.title)
            HStack {
                Spacer()
                VStack {
                    Text(game.players[0].name)
                    Text("\(game.tokenPlayers[0])")
                }.padding()
                
                Spacer()
                
                VStack {
                    Text(game.players[1].name)
                    Text("\(game.tokenPlayers[1])")
                }.padding()
                
                Spacer()
            }
            
            Divider()
        }
    }
    
    private var tokenToDistribute: some View {
        VStack {
            HStack {
                Text("Token To Distribute:")
                Spacer()
                Text("\(game.tokenToDistribute)").padding()
            }
            Divider()
        }
    }
    
}

struct RunningGame_Previews: PreviewProvider {
    static var previews: some View {
        RunningGame()
    }
}
