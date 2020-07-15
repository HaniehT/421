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
                
                Button(action: {
                    controller.keepNumber(position: 0)
                }, label: {
                    Text("\(controller.combimation?.values[0] ?? 0)")
                        .foregroundColor(.green)
                }).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    controller.keepNumber(position: 1)
                }, label: {
                    Text("\(controller.combimation?.values[1] ?? 0)")
                        .foregroundColor(.green)
                }).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    controller.keepNumber(position: 2)
                }, label: {
                    Text("\(controller.combimation?.values[2] ?? 0)")
                        .foregroundColor(.green)
                }).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            }
            Divider()
            
            if !controller.endGame {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        controller.play()
                    }) {
                        Text("Roll")
                    }
                
                    if controller.phase == 2 {
                        Spacer()
                        Button(action: {controller.stopRoll()}) {
                                Text("Stop")
                            }
                    }
                    
                    Spacer()
                }
            } else {
                VStack {
                    Text("Game Over")
                    Text("Winner \(controller.tokenPlayer0 == 0 ? "Richard" : "Nicolas")")
                }
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
