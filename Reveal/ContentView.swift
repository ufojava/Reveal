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
             @State private var playerAnswer = ""
             @State private var showAnswer = false
    
          
    

    
         
    
    
              
              //Random Game
              func randomGame()-> String {
                  
               //var newGame = ""
                  
                  return gameArray.randomElement() ?? ""
                  
                  
              }

    //Function to process selection
    
    func processSelection(inSelection: String)  {
        
        //Show Answer
        self.showAnswer.toggle()
        
        //Variable
        self.pickedAnimal = inSelection
        
        
        if self.pickedAnimal == self.newGame {
            
            self.playerAnswer = "Correct"
            
        } else {
            
            self.playerAnswer = "Incorrect. Try Tiles"
        }
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
                                
                                VStack {
                                    Text("CLICK CIRCLE")
                                        .foregroundColor(Color.green)
                                        .font(.custom("chalkboard SE", size: 25))
                                
                                   Image("gameStart").renderingMode(.original)
                                       .resizable()
                                       .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white,lineWidth: 3))
                                       .frame(width:200,height: 200)
                                
                                }
                               
                               }
                            
                            VStack {
                            
                            Spacer().frame(height: 10)
                                
                                if launchNewGame {
                                    
                                    Text("Can you guess the animal behid the squares??")
                                    .foregroundColor(Color.yellow)
                                    .font(.custom("chalkboard SE", size: 15))
                            
                            HStack {
                                    
                                
                                
                                
                                    //Answer Cow
                                    Button(action: {
                                            
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "cow2", legend: "Cow")
                                            .onTapGesture {
                                                playSound(sound: "cow", type: "mp3")
                                                
                                                self.processSelection(inSelection: "Cow")
                                                
                                        }
                                            
                                        
                                            
                                        
                                    }//End Button
                                
                                
                                    
                                    
                                    //Answer Horse
                                    Button(action: {
                                        
                                    
                                        
                                    }) {
                                        
                                        
                                        selectionIcon(image: "horse", legend: "Horse")
                                        .onTapGesture {
                                            
                                            playSound(sound: "horse", type: "mp3")
                                            self.processSelection(inSelection: "Horse")
                                        }
                                        
                                        
                                        
                                    }//End Button
                                    
                                    
                                    //Answer Pig
                                    Button(action: {
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "pig", legend: "Pig")
                                        .onTapGesture {
                                            
                                            playSound(sound: "pig", type: "mp3")
                                            self.processSelection(inSelection: "Pig")
                                        }
                                        
                                        
                                        
                                    }//End of Button
                                    
                                    
                                    //Answer LLama
                                    Button(action: {
                                        
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "llama", legend: "LLama")
                                        .onTapGesture {
                                            playSound(sound: "llama", type: "mp3")
                                            self.processSelection(inSelection: "Llama")
                                        
                                        }
                                        
                                    }
                                    
                                    //Answer Rabbit
                                    Button(action: {
                                        
                                   
                                      
                                    }) {
                                        
                                        selectionIcon(image: "rabbit", legend: "Rabbit")
                                        .onTapGesture {
                                            playSound(sound: "rabbit", type: "mp3")
                                            self.processSelection(inSelection: "Rabbit")
                                        }
                                        
                                        
                                    }//end of Button
                                    
                                    
                                    //Answer Sheep
                                    Button(action: {
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "sheep", legend: "Sheep")
                                        .onTapGesture {
                                            
                                            playSound(sound: "sheep", type: "mp3")
                                            self.processSelection(inSelection: "Sheep")
                                        }
                                        
                                        
                                    }//End of Button
                                    
                                }
                                }
                                    
                                }
                            
                            HStack {
                                
                                if showAnswer {
                            
                            Text("Your selection is: \(self.pickedAnimal)")
                                .font(.custom("chalkboard SE", size: 15))
                                .foregroundColor(Color.yellow)
                                
                                }
                                
                                Text("\(self.playerAnswer)")
                                .foregroundColor(Color.red)
                                
                            }
                            
                            
                            
                            
                                    
                            
                               
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








