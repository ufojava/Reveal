//
//  ContentView.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 23/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    
    //Games Array
              var gameArray = ["Cow","Horse","Lama","Pig","Rabbit","Sheep"]
              
              @State private var newGame = ""
              
              @State private var launchNewGame = false
              
              //Random Game
              func randomGame()-> String {
                  
               //var newGame = ""
                  
                  return gameArray.randomElement() ?? ""
                  
                  
              }

           
           
           var body: some View {
               
               
            ZStack {
                
                
                Color(red: 0.6, green: 0.3, blue: 0.3)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                           VStack {
                            
                            Text("What Am I ?")
                                .foregroundColor(Color.yellow)
                                .font(.custom("chalkboard SE", size: 30))
                               
                               Button(action: {
                                   
                                   self.newGame = ""
                                   
                                   self.newGame = self.randomGame()
                                   self.launchNewGame.toggle()
                                  
                                   
                               }) {
                                   
                                   Text("START")
                                       .foregroundColor(Color.green).bold()
                                    .font(.custom("chalkboard SE", size: 25))
                                   Image("animalStartButton").renderingMode(.original)
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width:100,height: 100)
                                     
                                       
                                   
                                   
                                   
                                   
                               }
                               Spacer()
                               
                               if launchNewGame {
                                   
                                   if self.newGame == "Cow" {
                                   
                                   Lama()
                                       
                                   } else if self.newGame == "Horse" {
                                       
                                       Horse()
                                       
                                   } else if self.newGame == "Lama" {
                                       
                                       Lama()
                                       
                                   } else if self.newGame == "Pig" {
                                       
                                       Pig()
                                       
                                   } else if self.newGame == "Rabbit" {
                                       
                                       Rabbit()
                                       
                                   } else if self.newGame == "Sheep" {
                                       
                                       Sheep()
                                   }
                               }
                               
                           }
                
            }
}
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



