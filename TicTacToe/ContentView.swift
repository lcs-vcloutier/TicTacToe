//
//  ContentView.swift
//  TicTacToe
//
//  Created by Cloutier, Vincent on 2020-10-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Tic Tac Toe")
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    var body: some View {
        
        VStack {
            
            // Gridview to play the game
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing:15), count: 3),spacing:15){
                
                ForEach(0..<9,id: \.self){index in
                    
                    Color.white
                }
            }
            .padding()
        }
    }
    
    // Calculating width
    func getWidth()->CGFloat{
        // Horizontal padding = 30
        // Spacing = 30
        let width = UIScreen.main.bounds.width - (30 + 30)
        return width / 3 
    }
}

