//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Maxim on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var botChoose = "Nothing"
    @State private var playerChoose = "Paper"
    @State private var winnerName = "Nobody"
    
    private let variants = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 25) {
                    Group {
                        Text("Bot")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        Picker("Choose", selection: $botChoose) {
                            ForEach(variants, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        .onTapGesture {
                            print("No access!")
                        }
                    }
                    .padding([.horizontal], geometry.size.width * 0.075)
                    Spacer()
                    Spacer()
                    Group {
                        Text("Winner:")
                            .font(.headline)
                        Text("\(winnerName)")
                            .font(.system(size: 80))
                    }
                    Spacer()
                    Spacer()
                    Group {
                        Text("You")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        Picker("Choose", selection: $playerChoose) {
                            ForEach(variants, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding([.horizontal], geometry.size.width * 0.075)
                    Button(action: chooseWinner){
                        Text("Play")
                            .font(.system(size: 32))
                            .frame(width: geometry.size.width * 0.8, height: 90)
                            
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    func chooseWinner() {
        botChoose = variants.randomElement() ?? variants[0]
        
        if (botChoose == "Rock" && playerChoose == "Paper") ||
            (botChoose == "Paper" && playerChoose == "Scissors") ||
            (botChoose == "Scissors" && playerChoose == "Rock") {
            winnerName = "You"
        } else if (playerChoose == "Rock" && botChoose == "Paper") ||
            (playerChoose == "Paper" && botChoose == "Scissors") ||
            (playerChoose == "Scissors" && botChoose == "Rock") {
            winnerName = "Bot"
        } else {
            winnerName = "Nobody"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
