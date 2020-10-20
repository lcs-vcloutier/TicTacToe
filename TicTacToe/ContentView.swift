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
    // Moves
    @State var moves = Array(repeating: "", count: 9)
    // Indentify current player
    @State var isPlaying = true
    @State var gameOver = false
    @State var msg = ""
    
    var body: some View {
        
        VStack {
            
            // Gridview to play the game
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing:15), count: 3),spacing:15){
                
                ForEach(0..<9,id: \.self){index in
                    
                    ZStack{
                        
                        //Flip animation
                        
                        Color.blue
                        
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .opacity(moves[index] != "" ? 1 : 0)
                    }
                    .frame(width: getWidth(), height: getWidth())
                    .cornerRadius(15)
                    .rotation3DEffect(
                        .init(degrees: moves[index] != "" ? 180 : 0),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
                        anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                        anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                        perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
                    )
                    // On tap add move
                    .onTapGesture(perform: {
                        
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            if moves[index] == ""{
                                moves[index] = isPlaying ? "X" : "0"
                                // Updating player
                                isPlaying.toggle()
                            }
                        }
                    })
                }
            }
            .padding()
        }
        // On change of moves check for winner
        .onChange(of: moves, perform: { value in
            checkWinner()
        })
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text("Winner"), message:Text(msg), dismissButton: .destructive(Text("Play Again"), action: {
                // Reset all data
                withAnimation(Animation.easeIn(duration: 0.5)){
                    moves.removeAll()
                    moves = Array(repeating: "", count: 9)
                    isPlaying = true
                }
            }))
        })
    }
    
    // Calculating width
    func getWidth()->CGFloat{
        // Horizontal padding = 30
        // Spacing = 30
        let width = UIScreen.main.bounds.width - (30 + 30)
        return width / 3
    }
    
    //Check for winner
    func checkWinner() {
        if checkMoves(player: "X"){
            
            // Alert view
            msg = "Player X Won"
            gameOver.toggle()
        }
        if checkMoves(player: "0"){
            
            // Alert view
            msg = "Player 0 Won"
            gameOver.toggle()
            
        }
    }
    func checkMoves(player: String)->Bool{
        
        // Horizontal Moves
        for i in stride(from: 0, through: 9, by: 3){
            
            if moves[1] == player && moves[i + 1] == player && moves[i + 2] == player{
                
                return true
            }
        }
        
        // Vertical Moves
        for i in 0...2{
            
            if moves[1] == player && moves[i + 3] == player && moves[i + 6] == player{
                
                return true
            }
        }
        
        // Diagonal Moves
        
        return false
    }
}

