//
//  GamesView.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 23/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

//Game Random Selector
struct Games: View {
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    
    //Function to process random numbers
    func processArray() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
    
   
 


    
    
    var body: some View {
        
        
        
        VStack {
            
            Button(action: {
                
                self.processArray()
                
                
            }) {
                
                
                
                Text("Get the next number")
                
            }
            
            ForEach(tempSquareArray,id: \.self) { number in
                
                Text("Temp \(number)")
            }
      
         Text("-------")
            
           
          ForEach(updatedOrigArray ,id: \.self) {updatedArray in
              
              Text("Original \(updatedArray)")
              
          }
            
            
            
        }
        
        
            
            
            
            
        
    
    }
}



struct Games_Previews: PreviewProvider {

    static var previews: some View {
    
    Games()
    }
}

//GAMES STRUCTS BELOW HERE

struct Rabbit: View {
    
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
    
    
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
    
    
    
    var body: some View {
        
        
        VStack {
            
            Spacer().frame(height: 10)
            
            
            HStack {
            
            Button(action: {
                             
                 self.processRandomNumber()
                 
             }) {
                 
                 
                 Text("Get Number")
                    .foregroundColor(Color.green)
                    .font(.custom("chalkboard SE", size: 15))
                 
                   }
                
                Text("Click on Square: \(self.revealTile)")
                    .foregroundColor(Color.yellow)
                    .font(.custom("chalkboard SE", size: 15))
            }
        
                HStack {//Row One
                    
             
                    
                    
                    FlipTile(tileImage: rabbitBackTileOneToggle, blankImage: rabbitBackTileOne, animalImage: rabbitTileOne)
                       
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 1 && self.revealTile != 0 {
                            
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
                        
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                        })
                  
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileTwoToggle, blankImage: rabbitBackTileTwo, animalImage: rabbitTileTwo)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 2 && self.revealTile != 0 {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                    
                    
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileThreeToggle, blankImage: rabbitBackTileThree, animalImage: rabbitTileThree)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 3 && self.revealTile != 0 {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                    
                    })
                    
                    
                    
                }//End of HStack
            
            
            
            
            
            
            Spacer().frame(height: 0)
                HStack {//Row Two
                    
                    FlipTile(tileImage: rabbitBackTileFourToggle, blankImage: rabbitBackTileFour, animalImage: rabbitTileFour)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 4 && self.revealTile != 0 {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                            
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileFiveToggle, blankImage: rabbitBackTileFive, animalImage: rabbitTileFive)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 5 && self.revealTile != 0 {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                            
                    })
                    
                    
                    Spacer().frame(width: 0)
                    FlipTile(tileImage: rabbitBackTileSixToggle, blankImage: rabbitBackTileSix, animalImage: rabbitTileSix)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 6 && self.revealTile != 0 {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                            
                    })
                }
            
            
            Spacer().frame(height: 0)
                HStack {//Row Three
                               
                     FlipTile(tileImage: rabbitBackTileSevenToggle, blankImage: rabbitBackTileSeven, animalImage: rabbitTileSeven)
                                       
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 7 && self.revealTile != 0 {
                           
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
                           
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                   })
                   Spacer().frame(width: 0)
                    
                     FlipTile(tileImage: rabbitBackTileEightToggle, blankImage: rabbitBackTileEight, animalImage: rabbitTileEight)
                                       
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 8 && self.revealTile != 0 {
                           
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
                                   
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                    })
                   Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileNineToggle, blankImage: rabbitBackTileNine, animalImage: rabbitTileNine)
                                       
                        .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 9 && self.revealTile != 0 {
                           
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
                                   
                            } else {
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                    })
               }
                    
            HStack {
            
                Text("Points: \(self.gameScore.score)")
                 
                 
             }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
            
            
         Spacer()
        }
        
        
        
    }
}




struct Sheep: View {
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    //Declare sheep tiles
    @State private var sheepTileOne = "sheepArt1"
    @State private var sheepTileTwo = "sheepArt2"
    @State private var sheepTileThree = "sheepArt3"
    @State private var sheepTileFour = "sheepArt4"
    @State private var sheepTileFive = "sheepArt5"
    @State private var sheepTileSix = "sheepArt6"
    @State private var sheepTileSeven = "sheepArt7"
    @State private var sheepTileEight = "sheepArt8"
    @State private var sheepTileNine = "sheepArt9"
    
    //Corespondong back buttons
    @State private var sheepBackTileOne = "animalArtBack1"
    @State private var sheepBackTileTwo = "animalArtBack2"
    @State private var sheepBackTileThree = "animalArtBack3"
    @State private var sheepBackTileFour = "animalArtBack4"
    @State private var sheepBackTileFive = "animalArtBack5"
    @State private var sheepBackTileSix = "animalArtBack6"
    @State private var sheepBackTileSeven = "animalArtBack7"
    @State private var sheepBackTileEight = "animalArtBack8"
    @State private var sheepBackTileNine = "animalArtBack9"
    
    
    //Rabit Toggle Variable
    
    //Rabit Back button
    @State private var sheepBackTileOneToggle = true
    @State private var sheepBackTileTwoToggle = true
    @State private var sheepBackTileThreeToggle = true
    @State private var sheepBackTileFourToggle = true
    @State private var sheepBackTileFiveToggle = true
    @State private var sheepBackTileSixToggle = true
    @State private var sheepBackTileSevenToggle = true
    @State private var sheepBackTileEightToggle = true
    @State private var sheepBackTileNineToggle = true
    
    
    
    
    
    //sheep Tile One
    @State private var sheepTileOneToggle = false
    @State private var sheepTileTwoToggle = false
    @State private var sheepTileThreeToggle = false
    
    //Row Two
    @State private var sheepTileFourToggle = false
    @State private var sheepTileFiveToggle = false
    @State private var sheepTileSixToggle = false
    
    //Row Three
    @State private var sheepTileSevenToggle = false
    @State private var sheepTileEightToggle = false
    @State private var sheepTileNineToggle = false
    
    
    //Variable to convert Point to a String
       var pointConverter: String {
           
           var intToTextConvert = ""
           var speechText = ""
           
           intToTextConvert = String(gameScore.score)
           speechText = "Your score is \(intToTextConvert)"
           
           return speechText
           
           
       }
    
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
       
    

    var body: some View {
        
        
        VStack {
            
            Spacer().frame(height: 10)
            
           
            HStack {
            
            Button(action: {
                             
                 self.processRandomNumber()
                 
             }) {
                 
                 
                 Text("Get Number")
                    .foregroundColor(Color.green)
                    .font(.custom("chalkboard SE", size: 15))
                 
                   }
                
                Text("Click on Square: \(self.revealTile)")
                    .foregroundColor(Color.yellow)
                    .font(.custom("chalkboard SE", size: 15))
            }
        

         HStack {//Row One
                           
                   FlipTile(tileImage: sheepBackTileOneToggle, blankImage: sheepBackTileOne, animalImage: sheepTileOne)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 1 && self.revealTile != 0 {
                           
                           self.sheepBackTileOneToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileOneToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                           
                           
                       })
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileTwoToggle, blankImage: sheepBackTileTwo, animalImage: sheepTileTwo)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 2 && self.revealTile != 0 {
                           
                           self.sheepBackTileTwoToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileTwoToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                   
                   
                   })
            
            
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileThreeToggle, blankImage: sheepBackTileThree, animalImage: sheepTileThree)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 3 && self.revealTile != 0 {
                           
                           self.sheepBackTileThreeToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                            if self.sheepBackTileThreeToggle == true {
                            
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                   
                   
                   })
                   
                   
                   
               }//End of HStack
           
           
           
           
           
           
           Spacer().frame(height: 0)
               HStack {//Row Two
                   
                   FlipTile(tileImage: sheepBackTileFourToggle, blankImage: sheepBackTileFour, animalImage: sheepTileFour)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 4 && self.revealTile != 0 {
                           
                           self.sheepBackTileFourToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                            if self.sheepBackTileFourToggle == true {
                            
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                           
                           
                   })
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileFiveToggle, blankImage: sheepBackTileFive, animalImage: sheepTileFive)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 5 && self.revealTile != 0 {
                           
                           self.sheepBackTileFiveToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                            if self.sheepBackTileFiveToggle == true {
                            
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
                            
                        } else {
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                           
                   })
                   Spacer().frame(width: 0)
                   FlipTile(tileImage: sheepBackTileSixToggle, blankImage: sheepBackTileSix, animalImage: sheepTileSix)
                   
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 6 && self.revealTile != 0 {
                           
                           self.sheepBackTileSixToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileSixToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                           
                   })
               }
           
           
           Spacer().frame(height: 0)
               HStack {//Row Three
                              
                    FlipTile(tileImage: sheepBackTileSevenToggle, blankImage: sheepBackTileSeven, animalImage: sheepTileSeven)
                                      
                      .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 7 && self.revealTile != 0 {
                          
                          self.sheepBackTileSevenToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileSevenToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                          
                  })
                  Spacer().frame(width: 0)
                   
                    FlipTile(tileImage: sheepBackTileEightToggle, blankImage: sheepBackTileEight, animalImage: sheepTileEight)
                                      
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 8 && self.revealTile != 0 {
                          
                          self.sheepBackTileEightToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileEightToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                                  
                   })
                  Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileNineToggle, blankImage: sheepBackTileNine, animalImage: sheepTileNine)
                                      
                       .gesture(TapGesture().onEnded() {
                        
                        if self.revealTile == 9 && self.revealTile != 0 {
                          
                          self.sheepBackTileNineToggle.toggle()
                        playSound(sound: "Swoosh", type: "mp3")
                        
                        if self.sheepBackTileNineToggle == true {
                        
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
                            
                        } else {
                            
                            readGameSpeech(word: "Get Number  or click the correct square")
                        }
                                  
                   })
              }
           
            HStack {
           
                Text("Points: \(self.gameScore.score)")
                
                
            }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
         Spacer()
       }
        
    }
    
    
}

struct Cow: View {
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    //Declare cow tiles
    @State private var cowTileOne = "cowArt1"
    @State private var cowTileTwo = "cowArt2"
    @State private var cowTileThree = "cowArt3"
    @State private var cowTileFour = "cowArt4"
    @State private var cowTileFive = "cowArt5"
    @State private var cowTileSix = "cowArt6"
    @State private var cowTileSeven = "cowArt7"
    @State private var cowTileEight = "cowArt8"
    @State private var cowTileNine = "cowArt9"
    
    //Corespondong back buttons
    @State private var cowBackTileOne = "animalArtBack1"
    @State private var cowBackTileTwo = "animalArtBack2"
    @State private var cowBackTileThree = "animalArtBack3"
    @State private var cowBackTileFour = "animalArtBack4"
    @State private var cowBackTileFive = "animalArtBack5"
    @State private var cowBackTileSix = "animalArtBack6"
    @State private var cowBackTileSeven = "animalArtBack7"
    @State private var cowBackTileEight = "animalArtBack8"
    @State private var cowBackTileNine = "animalArtBack9"
    
    
    //Rabit Toggle Variable
    
    //Rabit Back button
    @State private var cowBackTileOneToggle = true
    @State private var cowBackTileTwoToggle = true
    @State private var cowBackTileThreeToggle = true
    @State private var cowBackTileFourToggle = true
    @State private var cowBackTileFiveToggle = true
    @State private var cowBackTileSixToggle = true
    @State private var cowBackTileSevenToggle = true
    @State private var cowBackTileEightToggle = true
    @State private var cowBackTileNineToggle = true
    
    
    
    
    
    //cow Tile One
    @State private var cowTileOneToggle = false
    @State private var cowTileTwoToggle = false
    @State private var cowTileThreeToggle = false
    
    //Row Two
    @State private var cowTileFourToggle = false
    @State private var cowTileFiveToggle = false
    @State private var cowTileSixToggle = false
    
    //Row Three
    @State private var cowTileSevenToggle = false
    @State private var cowTileEightToggle = false
    @State private var cowTileNineToggle = false
    
 
   //Variable to convert Point to a String
         var pointConverter: String {
             
             var intToTextConvert = ""
             var speechText = ""
             
             intToTextConvert = String(gameScore.score)
             speechText = "Your score is \(intToTextConvert)"
             
             return speechText
             
             
         }
    
    
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
    
    var body: some View {
        
       VStack {
        
  
        Spacer().frame(height: 10)
        
                HStack {
                
                Button(action: {
                                 
                     self.processRandomNumber()
                     
                 }) {
                     
                     
                     Text("Get Number")
                        .foregroundColor(Color.green)
                        .font(.custom("chalkboard SE", size: 15))
                     
                       }
                    
                    Text("Click on Square: \(self.revealTile)")
                        .foregroundColor(Color.yellow)
                        .font(.custom("chalkboard SE", size: 15))
                }
            

             HStack {//Row One
                               
                       FlipTile(tileImage: cowBackTileOneToggle, blankImage: cowBackTileOne, animalImage: cowTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 1 && self.revealTile != 0 {
                               
                               self.cowBackTileOneToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileOneToggle == true {
                            
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
                               
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileTwoToggle, blankImage: cowBackTileTwo, animalImage: cowTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 2 && self.revealTile != 0 {
                               
                               self.cowBackTileTwoToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileTwoToggle == true {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileThreeToggle, blankImage: cowBackTileThree, animalImage: cowTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 3 && self.revealTile != 0 {
                               
                               self.cowBackTileThreeToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileThreeToggle == true {
                            
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
                       
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: cowBackTileFourToggle, blankImage: cowBackTileFour, animalImage: cowTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 4 && self.revealTile != 0 {
                               
                               self.cowBackTileFourToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileFourToggle == true {
                            
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
                               
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileFiveToggle, blankImage: cowBackTileFive, animalImage: cowTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 5 && self.revealTile != 0 {
                               
                               self.cowBackTileFiveToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileFiveToggle == true {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: cowBackTileSixToggle, blankImage: cowBackTileSix, animalImage: cowTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 6 && self.revealTile != 0 {
                               
                               self.cowBackTileSixToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileSixToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: cowBackTileSevenToggle, blankImage: cowBackTileSeven, animalImage: cowTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 7 && self.revealTile != 0 {
                              
                              self.cowBackTileSevenToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileSevenToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: cowBackTileEightToggle, blankImage: cowBackTileEight, animalImage: cowTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 8 && self.revealTile != 0 {
                              
                              self.cowBackTileEightToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileEightToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileNineToggle, blankImage: cowBackTileNine, animalImage: cowTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 9 && self.revealTile != 0 {
                              
                              self.cowBackTileNineToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.cowBackTileNineToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                  }
               
               
               HStack {
               
                    Text("Points: \(self.gameScore.score) ")
                    
                
                    
                    
                }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
            Spacer()
           }
            
        }
        
        
    }
    
struct Horse: View {
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    //Declare Horse tiles
    @State private var horseTileOne = "horseArt1"
    @State private var horseTileTwo = "horseArt2"
    @State private var horseTileThree = "horseArt3"
    @State private var horseTileFour = "horseArt4"
    @State private var horseTileFive = "horseArt5"
    @State private var horseTileSix = "horseArt6"
    @State private var horseTileSeven = "horseArt7"
    @State private var horseTileEight = "horseArt8"
    @State private var horseTileNine = "horseArt9"
    
    //Corespondong back buttons
    @State private var horseBackTileOne = "animalArtBack1"
    @State private var horseBackTileTwo = "animalArtBack2"
    @State private var horseBackTileThree = "animalArtBack3"
    @State private var horseBackTileFour = "animalArtBack4"
    @State private var horseBackTileFive = "animalArtBack5"
    @State private var horseBackTileSix = "animalArtBack6"
    @State private var horseBackTileSeven = "animalArtBack7"
    @State private var horseBackTileEight = "animalArtBack8"
    @State private var horseBackTileNine = "animalArtBack9"
    
    
    //Rabit Toggle Variable
    
    //Rabit Back button
    @State private var horseBackTileOneToggle = true
    @State private var horseBackTileTwoToggle = true
    @State private var horseBackTileThreeToggle = true
    @State private var horseBackTileFourToggle = true
    @State private var horseBackTileFiveToggle = true
    @State private var horseBackTileSixToggle = true
    @State private var horseBackTileSevenToggle = true
    @State private var horseBackTileEightToggle = true
    @State private var horseBackTileNineToggle = true
    
    
    
    
    
    //horse Tile One
    @State private var horseTileOneToggle = false
    @State private var horseTileTwoToggle = false
    @State private var horseTileThreeToggle = false
    
    //Row Two
    @State private var horseTileFourToggle = false
    @State private var horseTileFiveToggle = false
    @State private var horseTileSixToggle = false
    
    //Row Three
    @State private var horseTileSevenToggle = false
    @State private var horseTileEightToggle = false
    @State private var horseTileNineToggle = false
    

    //Variable to convert Point to a String
    var pointConverter: String {
        
        var intToTextConvert = ""
        var speechText = ""
        
        intToTextConvert = String(gameScore.score)
        speechText = "Your score is \(intToTextConvert)"
        
        return speechText
        
        
    }
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
   
    
    var body: some View {
        
        
        VStack {
            
            Spacer().frame(height: 10)
            
           HStack {
           
                   Button(action: {
                                    
                        self.processRandomNumber()
                        
                    }) {
                        
                        
                        Text("Get Number")
                           .foregroundColor(Color.green)
                           .font(.custom("chalkboard SE", size: 15))
                        
                          }
                       
                       Text("Click on Square: \(self.revealTile)")
                           .foregroundColor(Color.yellow)
                           .font(.custom("chalkboard SE", size: 15))
                   }
            

             HStack {//Row One
                               
                       FlipTile(tileImage: horseBackTileOneToggle, blankImage: horseBackTileOne, animalImage: horseTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 1 && self.revealTile != 0 {
                               
                               self.horseBackTileOneToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            
                            if self.horseBackTileOneToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                                
                            }
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileTwoToggle, blankImage: horseBackTileTwo, animalImage: horseTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 2 && self.revealTile != 0 {
                               
                               self.horseBackTileTwoToggle.toggle()
                                playSound(sound: "Swoosh", type: "mp3")
                            
                                if self.horseBackTileTwoToggle == true {
                                
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileThreeToggle, blankImage: horseBackTileThree, animalImage: horseTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 3 && self.revealTile != 0 {
                               
                               self.horseBackTileThreeToggle.toggle()
                               playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileThreeToggle == true {
                            
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
                                
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: horseBackTileFourToggle, blankImage: horseBackTileFour, animalImage: horseTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 4 && self.revealTile != 0 {
                               
                               self.horseBackTileFourToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileFourToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileFiveToggle, blankImage: horseBackTileFive, animalImage: horseTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 5 && self.revealTile != 0 {
                               
                               self.horseBackTileFiveToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileFiveToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: horseBackTileSixToggle, blankImage: horseBackTileSix, animalImage: horseTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 6 && self.revealTile != 0 {
                               
                               self.horseBackTileSixToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileSixToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: horseBackTileSevenToggle, blankImage: horseBackTileSeven, animalImage: horseTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 7 && self.revealTile != 0 {
                              
                              self.horseBackTileSevenToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileSevenToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: horseBackTileEightToggle, blankImage: horseBackTileEight, animalImage: horseTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 8 && self.revealTile != 0 {
                              
                              self.horseBackTileEightToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileEightToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileNineToggle, blankImage: horseBackTileNine, animalImage: horseTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 9 && self.revealTile != 0 {
                              
                              self.horseBackTileNineToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.horseBackTileNineToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       })
                  }
               
               
               HStack {
               
                    Text("Points: \(self.gameScore.score) ")
                    
                    
                }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
              Spacer()
           }
            
        }
}


struct Pig: View {
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    //Declare Pig tiles
    @State private var pigTileOne = "pigArt1"
    @State private var pigTileTwo = "pigArt2"
    @State private var pigTileThree = "pigArt3"
    @State private var pigTileFour = "pigArt4"
    @State private var pigTileFive = "pigArt5"
    @State private var pigTileSix = "pigArt6"
    @State private var pigTileSeven = "pigArt7"
    @State private var pigTileEight = "pigArt8"
    @State private var pigTileNine = "pigArt9"
    
    //Corespondong back buttons
    @State private var pigBackTileOne = "animalArtBack1"
    @State private var pigBackTileTwo = "animalArtBack2"
    @State private var pigBackTileThree = "animalArtBack3"
    @State private var pigBackTileFour = "animalArtBack4"
    @State private var pigBackTileFive = "animalArtBack5"
    @State private var pigBackTileSix = "animalArtBack6"
    @State private var pigBackTileSeven = "animalArtBack7"
    @State private var pigBackTileEight = "animalArtBack8"
    @State private var pigBackTileNine = "animalArtBack9"
    
    
    //Rabit Toggle Variable
    
    //Rabit Back button
    @State private var pigBackTileOneToggle = true
    @State private var pigBackTileTwoToggle = true
    @State private var pigBackTileThreeToggle = true
    @State private var pigBackTileFourToggle = true
    @State private var pigBackTileFiveToggle = true
    @State private var pigBackTileSixToggle = true
    @State private var pigBackTileSevenToggle = true
    @State private var pigBackTileEightToggle = true
    @State private var pigBackTileNineToggle = true
    
    
    
    
    
    //pig Tile One
    @State private var pigTileOneToggle = false
    @State private var pigTileTwoToggle = false
    @State private var pigTileThreeToggle = false
    
    //Row Two
    @State private var pigTileFourToggle = false
    @State private var pigTileFiveToggle = false
    @State private var pigTileSixToggle = false
    
    //Row Three
    @State private var pigTileSevenToggle = false
    @State private var pigTileEightToggle = false
    @State private var pigTileNineToggle = false
    

    //Variable to convert Point to a String
       var pointConverter: String {
           
           var intToTextConvert = ""
           var speechText = ""
           
           intToTextConvert = String(gameScore.score)
           speechText = "Your score is \(intToTextConvert)"
           
           return speechText
           
           
       }
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
   
    
    var body: some View {
        
        
       VStack {
        
        Spacer().frame(height: 10)
        
       
            HStack {
            
                    Button(action: {
                                     
                         self.processRandomNumber()
                         
                     }) {
                         
                         
                         Text("Get Number")
                            .foregroundColor(Color.green)
                            .font(.custom("chalkboard SE", size: 15))
                         
                           }
                        
                        Text("Click on Square: \(self.revealTile)")
                            .foregroundColor(Color.yellow)
                            .font(.custom("chalkboard SE", size: 15))
                    }

             HStack {//Row One
                               
                       FlipTile(tileImage: pigBackTileOneToggle, blankImage: pigBackTileOne, animalImage: pigTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 1 && self.revealTile != 0 {
                               
                               self.pigBackTileOneToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileOneToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                                
                            }
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileTwoToggle, blankImage: pigBackTileTwo, animalImage: pigTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 2 && self.revealTile != 0 {
                               
                               self.pigBackTileTwoToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileTwoToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileThreeToggle, blankImage: pigBackTileThree, animalImage: pigTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 3 && self.revealTile != 0 {
                               
                               self.pigBackTileThreeToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileThreeToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: pigBackTileFourToggle, blankImage: pigBackTileFour, animalImage: pigTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 4 && self.revealTile != 0 {
                               
                               self.pigBackTileFourToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileFourToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileFiveToggle, blankImage: pigBackTileFive, animalImage: pigTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 5 && self.revealTile != 0 {
                               
                               self.pigBackTileFiveToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileFiveToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: pigBackTileSixToggle, blankImage: pigBackTileSix, animalImage: pigTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 6 && self.revealTile != 0 {
                               
                               self.pigBackTileSixToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileSixToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: pigBackTileSevenToggle, blankImage: pigBackTileSeven, animalImage: pigTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 7 && self.revealTile != 0 {
                              
                              self.pigBackTileSevenToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileSevenToggle == true {
                            
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
                              
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: pigBackTileEightToggle, blankImage: pigBackTileEight, animalImage: pigTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 8 && self.revealTile != 0 {
                              
                              self.pigBackTileEightToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileEightToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileNineToggle, blankImage: pigBackTileNine, animalImage: pigTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 9 && self.revealTile != 0 {
                              
                              self.pigBackTileNineToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.pigBackTileNineToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                  }
               
               HStack {
               
                    Text("Points: \(self.gameScore.score) ")
                    
                    
                }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
               
              Spacer()
           }
            
        }
}


struct Lama: View {
    
    //Environment Object
    @EnvironmentObject var gameScore: GameScore
    
    //Declare Lama tiles
    @State private var lamaTileOne = "lamaArt1"
    @State private var lamaTileTwo = "lamaArt2"
    @State private var lamaTileThree = "lamaArt3"
    @State private var lamaTileFour = "lamaArt4"
    @State private var lamaTileFive = "lamaArt5"
    @State private var lamaTileSix = "lamaArt6"
    @State private var lamaTileSeven = "lamaArt7"
    @State private var lamaTileEight = "lamaArt8"
    @State private var lamaTileNine = "lamaArt9"
    
    //Corespondong back buttons
    @State private var lamaBackTileOne = "animalArtBack1"
    @State private var lamaBackTileTwo = "animalArtBack2"
    @State private var lamaBackTileThree = "animalArtBack3"
    @State private var lamaBackTileFour = "animalArtBack4"
    @State private var lamaBackTileFive = "animalArtBack5"
    @State private var lamaBackTileSix = "animalArtBack6"
    @State private var lamaBackTileSeven = "animalArtBack7"
    @State private var lamaBackTileEight = "animalArtBack8"
    @State private var lamaBackTileNine = "animalArtBack9"
    
    
    //Rabit Toggle Variable
    
    //Rabit Back button
    @State private var lamaBackTileOneToggle = true
    @State private var lamaBackTileTwoToggle = true
    @State private var lamaBackTileThreeToggle = true
    @State private var lamaBackTileFourToggle = true
    @State private var lamaBackTileFiveToggle = true
    @State private var lamaBackTileSixToggle = true
    @State private var lamaBackTileSevenToggle = true
    @State private var lamaBackTileEightToggle = true
    @State private var lamaBackTileNineToggle = true
    
    
    
    
    
    //lama Tile One
    @State private var lamaTileOneToggle = false
    @State private var lamaTileTwoToggle = false
    @State private var lamaTileThreeToggle = false
    
    //Row Two
    @State private var lamaTileFourToggle = false
    @State private var lamaTileFiveToggle = false
    @State private var lamaTileSixToggle = false
    
    //Row Three
    @State private var lamaTileSevenToggle = false
    @State private var lamaTileEightToggle = false
    @State private var lamaTileNineToggle = false
    
   
   //Variable to convert Point to a String
   var pointConverter: String {
       
       var intToTextConvert = ""
       var speechText = ""
       
       intToTextConvert = String(gameScore.score)
       speechText = "Your score is \(intToTextConvert)"
       
       return speechText
       
       
   }
    
    //All blank squares
    @State private var allBankSquares = [1,2,3,4,5,6,7,8,9]
    
    //Array to hold temp data
    @State private var tempSquareArray = [Int]()
    @State private var updatedOrigArray = [Int]()
    
    @State private var revealTile = 0
    
    
    //Function to process random numbers
    func processRandomNumber() {
        
        //Get random number
        let localOriginalArray = allBankSquares.randomElement()
        
        //Assign Value to Reveal variable
        self.revealTile = localOriginalArray!
        
        //Append to temporary
        tempSquareArray.append(localOriginalArray!)
        
        //Remove random number from original array set
        allBankSquares = allBankSquares.filter {$0 != localOriginalArray}
        
        updatedOrigArray = allBankSquares
        
    
    }
    
    
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 10)
            
            
            HStack {
            
                Button(action: {
                                 
                     self.processRandomNumber()
                     
                 }) {
                     
                     
                     Text("Get Number")
                        .foregroundColor(Color.green)
                        .font(.custom("chalkboard SE", size: 15))
                     
                       }
                    
                    Text("Click on Square: \(self.revealTile)")
                        .foregroundColor(Color.yellow)
                        .font(.custom("chalkboard SE", size: 15))
            }
           

             HStack {//Row One
                               
                       FlipTile(tileImage: lamaBackTileOneToggle, blankImage: lamaBackTileOne, animalImage: lamaTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 1 && self.revealTile != 0 {
                               
                               self.lamaBackTileOneToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileOneToggle == true {
                            
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
                               
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileTwoToggle, blankImage: lamaBackTileTwo, animalImage: lamaTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 2 && self.revealTile != 0 {
                               
                               self.lamaBackTileTwoToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileTwoToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileThreeToggle, blankImage: lamaBackTileThree, animalImage: lamaTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 3 && self.revealTile != 0 {
                               
                               self.lamaBackTileThreeToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileThreeToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: lamaBackTileFourToggle, blankImage: lamaBackTileFour, animalImage: lamaTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 4 && self.revealTile != 0 {
                               
                               self.lamaBackTileFourToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileFourToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileFiveToggle, blankImage: lamaBackTileFive, animalImage: lamaTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 5 && self.revealTile != 0 {
                               
                               self.lamaBackTileFiveToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileFiveToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: lamaBackTileSixToggle, blankImage: lamaBackTileSix, animalImage: lamaTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 6 && self.revealTile != 0 {
                               
                               self.lamaBackTileSixToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileSixToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                    FlipTile(tileImage: lamaBackTileSevenToggle, blankImage: lamaBackTileSeven, animalImage: lamaTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 7 && self.revealTile != 0 {
                              
                              self.lamaBackTileSevenToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileSevenToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                      })
                      Spacer().frame(width: 0)
                       
                    FlipTile(tileImage: lamaBackTileEightToggle, blankImage: lamaBackTileEight, animalImage: lamaTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 8 && self.revealTile != 0 {
                              
                              self.lamaBackTileEightToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileEightToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                      Spacer().frame(width: 0)
                       
                    FlipTile(tileImage: lamaBackTileNineToggle, blankImage: lamaBackTileNine, animalImage: lamaTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                            
                            if self.revealTile == 9 && self.revealTile != 0 {
                              
                              self.lamaBackTileNineToggle.toggle()
                            playSound(sound: "Swoosh", type: "mp3")
                            
                            if self.lamaBackTileNineToggle == true {
                            
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
                            } else {
                                
                                readGameSpeech(word: "Get Number  or click the correct square")
                            }
                                      
                       })
                  }
               
               HStack {
               
                    Text("Points: \(self.gameScore.score) ")
                    
                    
                }.font(.custom("chalkboard SE", size: 15)).foregroundColor(Color.yellow)
               
            Spacer()
           }
            
        }
        
    }






struct FlipTile: View {
    
  
    
    var tileImage: Bool
    var blankImage = ""
    var animalImage = ""
    
    
    var body: some View {
      
        
        
        
        Image(tileImage ? blankImage: animalImage)
                .resizable()
                .frame(width:92, height: 101, alignment: .center)
            
            
            //Set Animation
                 .rotation3DEffect(self.tileImage ? Angle(degrees: 0): Angle(degrees: 360), axis: (x:CGFloat(0), y:CGFloat(10), z:CGFloat(0)))
                           .animation(.default)
            
      
       
    }
    
    
}//End of FlipTile


struct selectionIcon: View {
    
    var image: String
    var legend: String
    
    var body: some View {
        
        VStack {
        
            Image(image).renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width:50,height: 50)
                
            
            Text(legend)
            .font(.custom("chalkboard SE", size: 15))
            .foregroundColor(Color.black)
        
            
            
        }
    }
}
