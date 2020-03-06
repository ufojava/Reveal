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
            @State private var showHelp = false
            @State private var showInstructionButton = true
            @State private var scrollGuessNumberLable = false
      
    
            @State private var pickedAnimal = ""
            @State private var playerAnswer = ""
            @State private var showAnswer = false
            
            //Count the number of tries
            @State private var guessAnimalCount = 0
            @State private var guessCountMessage = "Try guessing using Tiles / Click circle to play again"
            
            //Message alert if correct anser has been found
            @State private var showCorrectMessageAlert = false

    
    
              
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
            
            //To show alert
            gameScore.gameReset = "reset"
            self.showCorrectMessageAlert.toggle()
            
            //Read out selection
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                readGameSpeech(word: "Correct answer, well done")
                
                
            }
            
    
            
            
        } else {
            
            self.playerAnswer = "Incorrect"
            
            //Read out selection
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                readGameSpeech(word: "Incorrect answer, click on  get number")
                
            }
            self.guessAnimalCount += 1
        }
    }
    
    //Function to process try count
    func tryCount() {
        
        if self.guessAnimalCount > 0 && self.gameScore.score == 18  {
                      
              self.playerAnswer = "Maximum Guess Count Reached or Correct answer found"
                
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
                            
                    if showInstructionButton {
    
                            HStack {
                            Button(action: {
                                
                                withAnimation {
                                self.showHelp.toggle()
                                
                                }
                            }) {
                                
                             Text("Instructions")
                                .frame(width:150, height: 30)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                                
                                
                            }
                            
                            }
                            if showHelp {
                                
                              GameInstructions()
                                .transition(.slide)
                            }
                            
                    }
                            
                  
                     
                               
                               Button(action: {
                                   
                                    self.newGame = ""
                                    self.pickedAnimal = ""
                                    self.playerAnswer = ""
                                    self.guessAnimalCount = 0
                                    self.gameScore.score = 18
                                    self.gameScore.gameReset = ""
                               
                                   
                                
                                   self.newGame = self.randomGame()
                                
                                withAnimation {
                                    self.showRevealTitle.toggle()
                                }
                               
                                withAnimation {
                                    
                                    self.showInstructionButton.toggle()
                                }
                                
                                withAnimation {
                                   self.launchNewGame.toggle()
                                }
                                
                                withAnimation {
                                    
                                    self.scrollGuessNumberLable.toggle()
                                    
                                }
                                
                                //Check if the instructions sheet is opened
                                if self.showHelp == true {
                                    
                                    self.showHelp.toggle()
                                }
                                   
                               }) {
                                
                                VStack {
                                    
                                    if showRevealTitle == false {
                                      
                                    Text("REVEAL")
                                        .foregroundColor(Color.yellow)
                                        .font(.custom("chalkboard SE", size: 60))
                                        .transition(.slide)
                                        .onAppear() {
                                            
                                        playSound(sound: "After_School_Jamboree", type: "mp3")
                                          
                                                
                                        }
                                        Spacer().frame(height:160)
                                        
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
                                    
                                    
                                    if scrollGuessNumberLable {
                                        
                                    Text("GUESS THE ANIMAL BEHIND THE LARGE SQUARE !!!")
                                        .frame(width:400, height: 30)
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .font(.custom("chalkboard SE", size: 15))
                                        .cornerRadius(8)
                                        .transition(.slide)
                                    
                                
                                       
                                        
                                    }
                            HStack {
                                    
                                
                                
                                
                                    //Answer Cow
                                    Button(action: {
                                            
                                       
                                            
                                    }) {
                                        
                                        selectionIcon(image: "cow2", legend: "Cow")
                                            .onTapGesture {
                                                
                                            if self.gameScore.gameReset == "reset" {
                                               self.showCorrectMessageAlert.toggle()
                                           }
                                                
                                                
                                                
                                                if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                    
                                                    //Try Guess Count
                                                    self.tryCount()
                                                    
                                                } else {
                                                playSound(sound: "cow", type: "mp3")
                                                
                                                self.processSelection(inSelection: "Cow")
                                                }
                                                
                                                
                                                
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            
                                            Alert(title: Text("Congratulations!!"), message: Text("Click Circle to begin new game!! \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
                                        }
                                            
                                        
                                        
                                    }//End Button
                                
                                
                                    
                                    
                                    //Answer Horse
                                    Button(action: {
                                        
                                        
                                        
                                    }) {
                                        
                                        
                                        selectionIcon(image: "horse", legend: "Horse")
                                        .onTapGesture {
                                            
                                            if self.gameScore.gameReset == "reset" {
                                                self.showCorrectMessageAlert.toggle()
                                            }
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                            
                                                //Try Guess Count
                                                self.tryCount()
                                            
                                            } else {
                                                
                                            playSound(sound: "horse", type: "mp3")
                                            self.processSelection(inSelection: "Horse")
                                                
                                            }
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            Alert(title: Text("Congratulations!!"), message: Text("Click on circle to begin new game!! \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
                                        }
                                        
                                        
                                        
                                    }//End Button
                                    
                                    
                                    //Answer Pig
                                    Button(action: {
                                        
                                        
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "pig", legend: "Pig")
                                        .onTapGesture {
                                            
                                            if self.gameScore.gameReset == "reset" {
                                                self.showCorrectMessageAlert.toggle()
                                            }
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try Guess Count
                                                self.tryCount()
                                            } else {
                                            
                                            playSound(sound: "pig", type: "mp3")
                                            self.processSelection(inSelection: "Pig")
                                                
                                            }
                                            
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            Alert(title: Text("Congratulations!!"), message: Text("Click on circle to begin new game!! \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
                                        }
                                        
                                        
                                        
                                    }//End of Button
                                    
                                    
                                    //Answer LLama
                                    Button(action: {
                                        
                                        
                                        
                                       
                                        
                                    }) {
                                        
                                        selectionIcon(image: "llama", legend: "Llama")
                                        .onTapGesture {
                                            
                                            if self.gameScore.gameReset == "reset" {
                                                self.showCorrectMessageAlert.toggle()
                                            }
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try guess count
                                                self.tryCount()
                                            } else {
                                                
                                            
                                            playSound(sound: "llama", type: "mp3")
                                            self.processSelection(inSelection: "Llama")
                                            }
                                            
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            Alert(title: Text("Congratulations!!"), message: Text("Click on circle to begin new game!!  \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
                                        }
                                        
                                    }
                                    
                                    //Answer Rabbit
                                    Button(action: {
                                        
                                       
                                      
                                    }) {
                                        
                                        selectionIcon(image: "rabbit", legend: "Rabbit")
                                        .onTapGesture {
                                            
                                            if self.gameScore.gameReset == "reset" {
                                               self.showCorrectMessageAlert.toggle()
                                           }
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18{
                                                
                                                
                                                //Try guess count
                                                self.tryCount()
                                                
                                            } else {
                                            playSound(sound: "rabbit", type: "mp3")
                                            self.processSelection(inSelection: "Rabbit")
                                                
                                        }
                                        
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            Alert(title: Text("Congratulations!!"), message: Text("Click on circle to begin new game!!  \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
                                        }
                                        
                                    }//end of Button
                                    
                                    
                                    //Answer Sheep
                                    Button(action: {
                                        
                                        
                                       
                                    }) {
                                        
                                        selectionIcon(image: "sheep", legend: "Sheep")
                                        .onTapGesture {
                                            
                                            if self.gameScore.gameReset == "reset" {
                                                self.showCorrectMessageAlert.toggle()
                                            }
                                            
                                            if self.guessAnimalCount > 0 && self.gameScore.score == 18 {
                                                
                                                //Try guess count
                                                self.tryCount()
                                                
                                            } else {
                                            
                                            playSound(sound: "sheep", type: "mp3")
                                            self.processSelection(inSelection: "Sheep")
                                                
                                            }
                                            
                                        }.alert(isPresented: $showCorrectMessageAlert) {
                                            Alert(title: Text("Congratulations!!"), message: Text("Click on circle to begin new game!!  \(gameScore.score) Points"), dismissButton: .default(Text("Got it!!")))
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








