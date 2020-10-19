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
            //Gridview to play the game
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing:15), count: 3), spacing:15){
                
                ForEach(0..<9,id: \.self)){index in
                    
                    Color.white
                }
            }
        }
    }
}

