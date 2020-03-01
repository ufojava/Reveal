//
//  GameSelectorTest.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 01/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//Test game struct functionality
import SwiftUI


struct TestGround: View {
    
    var body: some View {
    

    
        Text("Place Holder")
        
        
        
    }
    
}





//Preview GameFunction
struct TestGround_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TestGround()
        
        
        
    }
}


/*
struct GameFunction: View {
    
    
    
    //Environment Object
            @EnvironmentObject var gameScore: GameScore
            
            
            //Declare rabbit tiles
            @State private var rabbitTileOne = "rabbitArt1"
            @State private var rabbitTileTwo = "rabbitArt2"
            @State private var rabbitTileThree = "rabbitArt3"
            @State private var rabbitTileFour = "rabbitArt4"
            @State private var rabbitTileFive = "rabbitArt5"
            @State private var rabbitTileSix = "rabbitArt6"
            @State private var rabbitTileSeven = "rabbitArt7"
            @State private var rabbitTileEight = "rabbitArt8"
            @State private var rabbitTileNine = "rabbitArt9"
    
            //All blank squares
            @State private var blankSquares = [1,2,3,4,5,6,7,8,9]
            @State private var tempBlankSquares = [Int]()
            @State private var randNumber = 0
            @State private var randomNumConvert = ""
           
            //Corespondong back buttons
            @State private var rabbitBackTileOne = "animalArtBack1"
            @State private var rabbitBackTileTwo = "animalArtBack2"
            @State private var rabbitBackTileThree = "animalArtBack3"
            @State private var rabbitBackTileFour = "animalArtBack4"
            @State private var rabbitBackTileFive = "animalArtBack5"
            @State private var rabbitBackTileSix = "animalArtBack6"
            @State private var rabbitBackTileSeven = "animalArtBack7"
            @State private var rabbitBackTileEight = "animalArtBack8"
            @State private var rabbitBackTileNine = "animalArtBack9"
            
            
            //Rabit Toggle Variable
            
            //Rabit Back button
            @State private var rabbitBackTileOneToggle = true
            @State private var rabbitBackTileTwoToggle = true
            @State private var rabbitBackTileThreeToggle = true
            @State private var rabbitBackTileFourToggle = true
            @State private var rabbitBackTileFiveToggle = true
            @State private var rabbitBackTileSixToggle = true
            @State private var rabbitBackTileSevenToggle = true
            @State private var rabbitBackTileEightToggle = true
            @State private var rabbitBackTileNineToggle = true
            
            
            
            
            
            //Rabbit Tile One
            @State private var rabbitTileOneToggle = false
            @State private var rabbitTileTwoToggle = false
            @State private var rabbitTileThreeToggle = false
            
            //Row Two
            @State private var rabbitTileFourToggle = false
            @State private var rabbitTileFiveToggle = false
            @State private var rabbitTileSixToggle = false
            
            //Row Three
            @State private var rabbitTileSevenToggle = false
            @State private var rabbitTileEightToggle = false
            @State private var rabbitTileNineToggle = false
            
          
           
            //Variable to convert Point to a String
            var pointConverter: String {
                
                var intToTextConvert = ""
                var speechText = ""
                
                intToTextConvert = String(gameScore.score)
                speechText = "Your score is \(intToTextConvert)"
                
                return speechText
                
                
            }
    
    //Function to select random button
    func randomSelect() -> Int {
        
        let randomNumber = blankSquares.randomElement()
        
        tempBlankSquares.append(randomNumber ?? 0)
            
        return randomNumber ?? 0
        
    }
    

        

          
          
          var body: some View {
              
              
              VStack {
                  
                  Spacer().frame(height: 10)
                  
             
                  
                  Spacer().frame(height: 20)
              
                      HStack {//Row One
                          
                    
                          
                          FlipTile(tileImage: rabbitBackTileOneToggle, blankImage: rabbitBackTileOne, animalImage: rabbitTileOne)
                             
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileOneToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileOneToggle == true {
                                      
                         
                                      
                                      self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      
                                      }
                                  } else {
                                      
                                      self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                  }
                              
                                  
                              })
                        
                          Spacer().frame(width: 0)
                          
                          FlipTile(tileImage: rabbitBackTileTwoToggle, blankImage: rabbitBackTileTwo, animalImage: rabbitTileTwo)
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileTwoToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileTwoToggle == true {
                                     
                                     self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                     } else {
                                         
                                         self.gameScore.score -= 2
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                     }
                          
                          
                          })
                          Spacer().frame(width: 0)
                          
                          FlipTile(tileImage: rabbitBackTileThreeToggle, blankImage: rabbitBackTileThree, animalImage: rabbitTileThree)
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileThreeToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileThreeToggle == true {
                                     
                                     self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                         
                                     } else {
                                         
                                         self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                     }
                          
                          
                          })
                          
                          
                          
                      }//End of HStack
                  
                  
                  
                  
                  
                  
                  Spacer().frame(height: 0)
                      HStack {//Row Two
                          
                          FlipTile(tileImage: rabbitBackTileFourToggle, blankImage: rabbitBackTileFour, animalImage: rabbitTileFour)
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileFourToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileFourToggle == true {
                                     
                                      self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                          
                                      } else {
                                          
                                          self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                      }
                                  
                                  
                          })
                          Spacer().frame(width: 0)
                          
                          FlipTile(tileImage: rabbitBackTileFiveToggle, blankImage: rabbitBackTileFive, animalImage: rabbitTileFive)
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileFiveToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileFiveToggle == true {
                                     
                                     self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                         
                                     } else {
                                         
                                         self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                     }
                                  
                          })
                          
                          
                          Spacer().frame(width: 0)
                          FlipTile(tileImage: rabbitBackTileSixToggle, blankImage: rabbitBackTileSix, animalImage: rabbitTileSix)
                          
                              .gesture(TapGesture().onEnded() {
                                  
                                  self.rabbitBackTileSixToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileSixToggle == true {
                                      
                                      self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                          
                                      } else {
                                          
                                          self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                      }
                                  
                          })
                      }
                  
                  
                  Spacer().frame(height: 0)
                      HStack {//Row Three
                                     
                           FlipTile(tileImage: rabbitBackTileSevenToggle, blankImage: rabbitBackTileSeven, animalImage: rabbitTileSeven)
                                             
                             .gesture(TapGesture().onEnded() {
                                 
                                 self.rabbitBackTileSevenToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                              
                                 if self.rabbitBackTileSevenToggle == true {
                                  
                                 self.gameScore.score += 2
                                  
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                  //Read Current Score
                                  readGameSpeech(word: self.pointConverter)
                                  }
                                     
                                 } else {
                                     
                                     self.gameScore.score -= 2
                                  
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                  //Read Current Score
                                  readGameSpeech(word: self.pointConverter)
                                  }
                                 }
                                 
                         })
                         Spacer().frame(width: 0)
                          
                           FlipTile(tileImage: rabbitBackTileEightToggle, blankImage: rabbitBackTileEight, animalImage: rabbitTileEight)
                                             
                              .gesture(TapGesture().onEnded() {
                                 
                                 self.rabbitBackTileEightToggle.toggle()
                                 playSound(sound: "Swoosh", type: "mp3")
                                  
                                  if self.rabbitBackTileEightToggle == true {
                                      
                                     self.gameScore.score += 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                         
                                     } else {
                                         
                                         self.gameScore.score -= 2
                                      
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                      //Read Current Score
                                      readGameSpeech(word: self.pointConverter)
                                      }
                                     }
                                         
                          })
                         Spacer().frame(width: 0)
                          
                          FlipTile(tileImage: rabbitBackTileNineToggle, blankImage: rabbitBackTileNine, animalImage: rabbitTileNine)
                                             
                              .gesture(TapGesture().onEnded() {
                                 
                                 self.rabbitBackTileNineToggle.toggle()
                                  playSound(sound: "Swoosh", type: "mp3")
                               
                                  
                                  if self.rabbitBackTileNineToggle == true {
                                
                                  self.gameScore.score += 2
                                      
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                  //Read Current Score
                                  readGameSpeech(word: self.pointConverter)
                                  }
                                      
                                  } else {
                                      
                                      self.gameScore.score -= 2
                                      
                                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                  //Read Current Score
                                  readGameSpeech(word: self.pointConverter)
                                  }
                                  }
                                         
                          })
                     }
                          
                  HStack {
                  
                      Text("Points: \(self.gameScore.score) ")
                    //Text("Hello \(self.randomNumConvert)")
                       
                       
                   }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
                  
                
                Button(action: {
                    
                    //self.randNumber = self.randomSelect()
                    //self.randomNumConvert = String(self.randNumber)
                
                    
                }) {
                    
                    Text("Get Random Number")
                    
                    
                    
                }
                
                
                  
               Spacer()
              }
        
    }
}

 */
