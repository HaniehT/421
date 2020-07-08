//
//  StartGame.swift
//  DiceGame421
//
//  Created by Nicolas Savoini on 2020-07-08.
//

import SwiftUI

struct StartGame: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                Text("Token to Start : 15").padding()
                
                Text("Number of Player: 2").padding()
                
                Spacer()
                
                NavigationLink("PLAY", destination: RunningGame())
                
                Spacer()
                
            }
        }
        .navigationBarTitle("421",displayMode: .inline)
        
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartGame()
        }
    }
}
