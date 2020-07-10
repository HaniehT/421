//
//  RunningGame.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-08.
//

import SwiftUI

struct RunningGame: View {
    @ObservedObject var controller = GameController()
    
    var body: some View {
        VStack {

            playerScore
            
            if controller.phase == 1 {
                tokenToDistribute
            }
            
            HStack {
                Text("Player Playing:")
                Spacer()
                Text(controller.playerPlayingName).padding()
            }
            Divider()
           
            HStack {
                
                Text(("\(controller.combimation?.values[0] ?? 0)"))
                    
                Text(("\(controller.combimation?.values[1] ?? 0)"))

                Text(("\(controller.combimation?.values[2] ?? 0)"))
                
            }
            Divider()
            
            HStack {
                Spacer()
                Button(action: {
                    controller.play()
                }) {
                    Text("Roll")
                }
                Spacer()
                
                if controller.phase == 2 {
                    Button(action: {controller.stopRoll()}) {
                            Text("Stop")
                        }
                }
                
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
                    Text("Richard")
                    Text("\(controller.tokenPlayer0)")
                }.padding()
                
                Spacer()
                
                VStack {
                    Text("Nicolas")
                    Text("\(controller.tokenPlayer1)")
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
                Text("\(controller.tokenToDistribute)").padding()
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
