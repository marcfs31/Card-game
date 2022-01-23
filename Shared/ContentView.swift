//
//  ContentView.swift
//  Shared
//
//  Created by Marc Fors on 23/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0;
    @State private var cpuScore = 0;
    @State private var winner = false;
    @State private var hasPlayerWon = "undefined";
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Image("logo")
                }
                Spacer()
                
                // Winner message handling
                if hasPlayerWon == "yes" {
                    Text("Congrats player!").font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                } else if hasPlayerWon == "no" {
                    Text("Congrats CPU!").font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                }
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                // Deal button
                Spacer()
                if (playerScore < 10 && cpuScore < 10) {
                    Button(action: {
                        // Randomize cards
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        // Update cards
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                        
                        // Update the score
                        if playerRand > cpuRand {
                            playerScore += 1
                        } else if cpuRand > playerRand {
                            cpuScore += 1
                        }
                        
                        // Handle winner
                        if playerScore == 10 {
                            winner = true
                            hasPlayerWon = "yes"
                        } else if cpuScore == 10 {
                            winner = true
                            hasPlayerWon = "no"
                        }
                    }, label: {
                        Image("dealbutton")
                    })
                } else {
                    // If there's a winner show play again button and reset game
                    Button(action: {
                        playerCard = "back"
                        cpuCard = "back"
                        playerScore = 0
                        cpuScore = 0
                        hasPlayerWon = "undefined"
                    }, label: {
                        Text("Play Again")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .padding(.bottom, 10.0)
                    })
                }
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        // Text with modifiers for the player
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        // Text with modifiers for the CPU
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
