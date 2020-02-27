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
    
              
              //Variables
              
              @State private var newGame = ""
              
              @State private var launchNewGame = false
    
             @State private var pickedAnimal = ""
             @State private var playerAnswer = false
    
          
    

    
         
    
    
              
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
                            
        
                               
                               Button(action: {
                                   
                                   self.newGame = ""
                                   
                                   self.newGame = self.randomGame()
                                   self.launchNewGame.toggle()
                                  
                                   
                               }) {
                                
                        
                                
                                   Image("gameStart").renderingMode(.original)
                                       .resizable()
                                       .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white,lineWidth: 3))
                                       .frame(width:200,height: 200)
                                
                                    
                               
                               }
                            
                            VStack {
                            
                            Spacer().frame(height: 10)
                                
                                if launchNewGame {
                            
                            HStack {
                                    
                                    //Answer Cow
                                    Button(action: {
                                            
                                        self.pickedAnimal = "cow"
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "cow2", legend: "Cow")
                                        
                                            
                                        
                                            
                                        
                                    }//End Button
                                
                                
                                    
                                    
                                    //Answer Horse
                                    Button(action: {
                                        
                                        self.pickedAnimal = "horse"
                                        
                                    }) {
                                        
                                        
                                        selectionIcon(image: "horse", legend: "Horse")
                                        
                                        
                                        
                                    }//End Button
                                    
                                    
                                    //Answer Pig
                                    Button(action: {}) {
                                        
                                        selectionIcon(image: "pig", legend: "Pig")
                                        
                                        
                                        
                                    }//End of Button
                                    
                                    
                                    //Answer LLama
                                    Button(action: {}) {
                                        
                                        selectionIcon(image: "llama", legend: "LLama")
                                        
                                        
                                        
                                    }
                                    
                                    //Answer Rabbit
                                    Button(action: {}) {
                                        
                                        selectionIcon(image: "rabbit", legend: "Rabbit")
                                        
                                        
                                    }//end of Button
                                    
                                    
                                    //Answer Sheep
                                    Button(action: {}) {
                                        
                                        selectionIcon(image: "sheep", legend: "Sheep")
                                        
                                        
                                    }//End of Button
                                    
                                }
                                }
                                    
                                }
                            
                            Text("Your selection is: \(self.pickedAnimal)")
                                .font(.custom("chalkboard SE", size: 15))
                                .foregroundColor(Color.yellow)
                               
                             Spacer().frame(height:30)
            
                            
                               if launchNewGame {
                                   
                                   if self.newGame == "Cow" {
                                   
                                   Cow()
                            
                                       
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
            
                          
                            
                           // Spacer()
                            
                               
                           }
                
            }
}
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








