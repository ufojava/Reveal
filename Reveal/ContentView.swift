//
//  ContentView.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 23/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    
    //Games Array
              var gameArray = ["Cow","Horse","Llama","Pig","Rabbit","Sheep"]
    
              
              //Variables
              
            @State private var newGame = ""
              
            @State private var launchNewGame = false
            @State private var showRevealTitle =  false
      
    
            @State private var pickedAnimal = ""
            @State private var playerAnswer = ""
            @State private var showAnswer = false
            
            //Count the number of tries
            @State private var guessAnimalCount = 0
            @State private var guessCountMessage = "Try guessing using Tiles"
    
          

    
              
              //Random Game
              func randomGame()-> String {
                  
               //var newGame = ""
                  
                  return gameArray.randomElement() ?? ""
                  
                  
              }

    //Function to process selection
    
    func processSelection(inSelection: String)  {
        
        
        //Variable
        self.pickedAnimal = inSelection
    
        //Count test
        tryCount()
        
        
        
        if self.pickedAnimal == self.newGame {
            
            self.playerAnswer = "Correct"
            self.guessAnimalCount += 1
            
            //Read out selection
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                readGameSpeech(word: "Correct answer, well done")
                
            }
            
        } else {
            
            self.playerAnswer = "Incorrect"
            
            //Read out selection
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                readGameSpeech(word: "Incorrect answer, click on square to provide clue to correct answer")
                
            }
            self.guessAnimalCount += 1
        }
    }
    
    //Function to process try count
    func tryCount() {
        
        if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                      
              self.playerAnswer = "Maximum Guess Count Reached"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                    self.playerAnswer = self.guessCountMessage
                }
              return
          }

        
    }

    
           
           
           var body: some View {
               
               
            ZStack {
                
                
                Color(red: 0.6, green: 0.3, blue: 0.3)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                           VStack {
                            
                            
                               
                               Button(action: {
                                   
                                    self.newGame = ""
                                    self.pickedAnimal = ""
                                    self.playerAnswer = ""
                                    self.guessAnimalCount = 0
                                    self.gameScore.score = 18
                                
                                   self.newGame = self.randomGame()
                                
                                withAnimation {
                                    self.showRevealTitle.toggle()
                                }
                                
                                withAnimation {
                                   self.launchNewGame.toggle()
                                }
                                   
                               }) {
                                
                                VStack {
                                    
                                    if showRevealTitle == false {
                                      
                                    Text("REVEAL")
                                        .foregroundColor(Color.yellow)
                                        .font(.custom("chalkboard SE", size: 60))
                                        .transition(.slide)
                                        .onAppear() {
                                            playSound(sound: "reveal", type: "mp3")
                                        }
                                        Spacer()
                                        
                                    }
                                    
                                
                                
                                    Text("START / CLOSE")
                                        .foregroundColor(Color.green)
                                        .font(.custom("chalkboard SE", size: 25))
                                
                                   Image("gameStart").renderingMode(.original)
                                       .resizable()
                                       .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white,lineWidth: 3))
                                       .frame(width:200,height: 200)
                                  
                                Spacer()
                                  
                                
                                
                                }
                               
                               }
                            
                            VStack {
                            
                            Spacer().frame(height: 10)
                                
                                if launchNewGame {
                                    
                                    Text("Can you guess the animal behid the squares??")
                                    .foregroundColor(Color.yellow)
                                    .font(.custom("chalkboard SE", size: 15))
                                        .transition(.move(edge: .bottom))
                            
                            HStack {
                                    
                                
                                
                                
                                    //Answer Cow
                                    Button(action: {
                                            
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "cow2", legend: "Cow")
                                            .onTapGesture {
                                                
                                                
                                                
                                                if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                    
                                                    //Try Guess Count
                                                    self.tryCount()
                                                    
                                                } else {
                                                playSound(sound: "cow", type: "mp3")
                                                
                                                self.processSelection(inSelection: "Cow")
                                                }
                                        }
                                            
                                        
                                            
                                        
                                    }//End Button
                                
                                
                                    
                                    
                                    //Answer Horse
                                    Button(action: {
                                        
                                    
                                        
                                    }) {
                                        
                                        
                                        selectionIcon(image: "horse", legend: "Horse")
                                        .onTapGesture {
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                            
                                                //Try Guess Count
                                                self.tryCount()
                                            
                                            } else {
                                                
                                            playSound(sound: "horse", type: "mp3")
                                            self.processSelection(inSelection: "Horse")
                                                
                                            }
                                        }
                                        
                                        
                                        
                                    }//End Button
                                    
                                    
                                    //Answer Pig
                                    Button(action: {
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "pig", legend: "Pig")
                                        .onTapGesture {
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try Guess Count
                                                self.tryCount()
                                            } else {
                                            
                                            playSound(sound: "pig", type: "mp3")
                                            self.processSelection(inSelection: "Pig")
                                                
                                            }
                                        }
                                        
                                        
                                        
                                    }//End of Button
                                    
                                    
                                    //Answer LLama
                                    Button(action: {
                                        
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "llama", legend: "Llama")
                                        .onTapGesture {
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try guess count
                                                self.tryCount()
                                            } else {
                                                
                                            
                                            playSound(sound: "llama", type: "mp3")
                                            self.processSelection(inSelection: "Llama")
                                            }
                                        }
                                        
                                    }
                                    
                                    //Answer Rabbit
                                    Button(action: {
                                        
                                   
                                      
                                    }) {
                                        
                                        selectionIcon(image: "rabbit", legend: "Rabbit")
                                        .onTapGesture {
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18{
                                                
                                                
                                                //Try guess count
                                                self.tryCount()
                                                
                                            } else {
                                            playSound(sound: "rabbit", type: "mp3")
                                            self.processSelection(inSelection: "Rabbit")
                                        }
                                        
                                        }
                                        
                                    }//end of Button
                                    
                                    
                                    //Answer Sheep
                                    Button(action: {
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "sheep", legend: "Sheep")
                                        .onTapGesture {
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try guess count
                                                self.tryCount()
                                                
                                            } else {
                                            
                                            playSound(sound: "sheep", type: "mp3")
                                            self.processSelection(inSelection: "Sheep")
                                            }
                                        }
                                        
                                        
                                    }//End of Button
                                    
                                }
                                }
                                    
                                }
                            
                            HStack {
                                
                                Text("\(self.playerAnswer)")
                                    .foregroundColor(Color.yellow)
                                    .font(.custom("chalkboard SE", size: 15))
                                
                                
                                
                            }
                            
                            
                            
                            
                                    
                            
                               
                             Spacer().frame(height:30)
            
                            
                               if launchNewGame {
                                   
                                   if self.newGame == "Cow" {
                                   
                                   Cow()
                            
                                       
                                   } else if self.newGame == "Horse" {
                                       
                                       Horse()
                                  
                                       
                                   } else if self.newGame == "Llama" {
                                       
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








