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
        
        
        
        VStack {
            
            Button(action: {
                
                self.newGame = ""
                
                self.newGame = self.randomGame()
                self.launchNewGame.toggle()
               
                
            }) {
                
                Text("START")
                    .foregroundColor(Color.green).bold()
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



struct Games_Previews: PreviewProvider {

    static var previews: some View {
    
    Games()
    }
}

//GAMES STRUCTS BELOW HERE

struct Rabbit: View {
    
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
    
    
    
    
    var body: some View {
        
        
        VStack {
            
            Spacer().frame(height: 10)
        
                HStack {//Row One
                    
                    FlipTile(tileImage: rabbitBackTileOneToggle, blankImage: rabbitBackTileOne, animalImage: rabbitTileOne)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileOneToggle.toggle()
                            
                            
                        })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileTwoToggle, blankImage: rabbitBackTileTwo, animalImage: rabbitTileTwo)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileTwoToggle.toggle()
                    
                    
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileThreeToggle, blankImage: rabbitBackTileThree, animalImage: rabbitTileThree)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileThreeToggle.toggle()
                    
                    
                    })
                    
                    
                    
                }//End of HStack
            
            
            
            
            
            
            Spacer().frame(height: 0)
                HStack {//Row Two
                    
                    FlipTile(tileImage: rabbitBackTileFourToggle, blankImage: rabbitBackTileFour, animalImage: rabbitTileFour)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileFourToggle.toggle()
                            
                            
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileFiveToggle, blankImage: rabbitBackTileFive, animalImage: rabbitTileFive)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileFiveToggle.toggle()
                            
                    })
                    Spacer().frame(width: 0)
                    FlipTile(tileImage: rabbitBackTileSixToggle, blankImage: rabbitBackTileSix, animalImage: rabbitTileSix)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileSixToggle.toggle()
                            
                    })
                }
            
            
            Spacer().frame(height: 0)
                HStack {//Row Three
                               
                     FlipTile(tileImage: rabbitBackTileSevenToggle, blankImage: rabbitBackTileSeven, animalImage: rabbitTileSeven)
                                       
                       .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileSevenToggle.toggle()
                           
                   })
                   Spacer().frame(width: 0)
                    
                     FlipTile(tileImage: rabbitBackTileEightToggle, blankImage: rabbitBackTileEight, animalImage: rabbitTileEight)
                                       
                        .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileEightToggle.toggle()
                                   
                    })
                   Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileNineToggle, blankImage: rabbitBackTileNine, animalImage: rabbitTileNine)
                                       
                        .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileNineToggle.toggle()
                                   
                    })
               }
            
            
            
         Spacer()
        }
        
        
        
    }
}




struct Sheep: View {
    
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

    var body: some View {
        
        
        VStack {
            Spacer().frame(height: 10)
        

         HStack {//Row One
                           
                   FlipTile(tileImage: sheepBackTileOneToggle, blankImage: sheepBackTileOne, animalImage: sheepTileOne)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileOneToggle.toggle()
                           
                           
                       })
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileTwoToggle, blankImage: sheepBackTileTwo, animalImage: sheepTileTwo)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileTwoToggle.toggle()
                   
                   
                   })
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileThreeToggle, blankImage: sheepBackTileThree, animalImage: sheepTileThree)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileThreeToggle.toggle()
                   
                   
                   })
                   
                   
                   
               }//End of HStack
           
           
           
           
           
           
           Spacer().frame(height: 0)
               HStack {//Row Two
                   
                   FlipTile(tileImage: sheepBackTileFourToggle, blankImage: sheepBackTileFour, animalImage: sheepTileFour)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileFourToggle.toggle()
                           
                           
                   })
                   Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileFiveToggle, blankImage: sheepBackTileFive, animalImage: sheepTileFive)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileFiveToggle.toggle()
                           
                   })
                   Spacer().frame(width: 0)
                   FlipTile(tileImage: sheepBackTileSixToggle, blankImage: sheepBackTileSix, animalImage: sheepTileSix)
                   
                       .gesture(TapGesture().onEnded() {
                           
                           self.sheepBackTileSixToggle.toggle()
                           
                   })
               }
           
           
           Spacer().frame(height: 0)
               HStack {//Row Three
                              
                    FlipTile(tileImage: sheepBackTileSevenToggle, blankImage: sheepBackTileSeven, animalImage: sheepTileSeven)
                                      
                      .gesture(TapGesture().onEnded() {
                          
                          self.sheepBackTileSevenToggle.toggle()
                          
                  })
                  Spacer().frame(width: 0)
                   
                    FlipTile(tileImage: sheepBackTileEightToggle, blankImage: sheepBackTileEight, animalImage: sheepTileEight)
                                      
                       .gesture(TapGesture().onEnded() {
                          
                          self.sheepBackTileEightToggle.toggle()
                                  
                   })
                  Spacer().frame(width: 0)
                   
                   FlipTile(tileImage: sheepBackTileNineToggle, blankImage: sheepBackTileNine, animalImage: sheepTileNine)
                                      
                       .gesture(TapGesture().onEnded() {
                          
                          self.sheepBackTileNineToggle.toggle()
                                  
                   })
              }
           
           
           
         Spacer()
       }
        
    }
    
    
}

struct Cow: View {
    
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
    
    var body: some View {
        
       VStack {
        Spacer().frame(height: 10)
            

             HStack {//Row One
                               
                       FlipTile(tileImage: cowBackTileOneToggle, blankImage: cowBackTileOne, animalImage: cowTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileOneToggle.toggle()
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileTwoToggle, blankImage: cowBackTileTwo, animalImage: cowTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileTwoToggle.toggle()
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileThreeToggle, blankImage: cowBackTileThree, animalImage: cowTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileThreeToggle.toggle()
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: cowBackTileFourToggle, blankImage: cowBackTileFour, animalImage: cowTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileFourToggle.toggle()
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileFiveToggle, blankImage: cowBackTileFive, animalImage: cowTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileFiveToggle.toggle()
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: cowBackTileSixToggle, blankImage: cowBackTileSix, animalImage: cowTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.cowBackTileSixToggle.toggle()
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: cowBackTileSevenToggle, blankImage: cowBackTileSeven, animalImage: cowTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                              
                              self.cowBackTileSevenToggle.toggle()
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: cowBackTileEightToggle, blankImage: cowBackTileEight, animalImage: cowTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.cowBackTileEightToggle.toggle()
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: cowBackTileNineToggle, blankImage: cowBackTileNine, animalImage: cowTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.cowBackTileNineToggle.toggle()
                                      
                       })
                  }
               
               
               
            Spacer()
           }
            
        }
        
        
    }
    
struct Horse: View {
    
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
    
    var body: some View {
        
        
        VStack {
            Spacer().frame(height: 10)
            

             HStack {//Row One
                               
                       FlipTile(tileImage: horseBackTileOneToggle, blankImage: horseBackTileOne, animalImage: horseTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileOneToggle.toggle()
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileTwoToggle, blankImage: horseBackTileTwo, animalImage: horseTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileTwoToggle.toggle()
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileThreeToggle, blankImage: horseBackTileThree, animalImage: horseTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileThreeToggle.toggle()
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: horseBackTileFourToggle, blankImage: horseBackTileFour, animalImage: horseTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileFourToggle.toggle()
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileFiveToggle, blankImage: horseBackTileFive, animalImage: horseTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileFiveToggle.toggle()
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: horseBackTileSixToggle, blankImage: horseBackTileSix, animalImage: horseTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.horseBackTileSixToggle.toggle()
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: horseBackTileSevenToggle, blankImage: horseBackTileSeven, animalImage: horseTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                              
                              self.horseBackTileSevenToggle.toggle()
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: horseBackTileEightToggle, blankImage: horseBackTileEight, animalImage: horseTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.horseBackTileEightToggle.toggle()
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: horseBackTileNineToggle, blankImage: horseBackTileNine, animalImage: horseTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.horseBackTileNineToggle.toggle()
                                      
                       })
                  }
               
               
               
              Spacer()
           }
            
        }
}


struct Pig: View {
    
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
    
    var body: some View {
        
        
       VStack {
        Spacer().frame(height: 10)
            

             HStack {//Row One
                               
                       FlipTile(tileImage: pigBackTileOneToggle, blankImage: pigBackTileOne, animalImage: pigTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileOneToggle.toggle()
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileTwoToggle, blankImage: pigBackTileTwo, animalImage: pigTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileTwoToggle.toggle()
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileThreeToggle, blankImage: pigBackTileThree, animalImage: pigTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileThreeToggle.toggle()
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: pigBackTileFourToggle, blankImage: pigBackTileFour, animalImage: pigTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileFourToggle.toggle()
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileFiveToggle, blankImage: pigBackTileFive, animalImage: pigTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileFiveToggle.toggle()
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: pigBackTileSixToggle, blankImage: pigBackTileSix, animalImage: pigTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.pigBackTileSixToggle.toggle()
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: pigBackTileSevenToggle, blankImage: pigBackTileSeven, animalImage: pigTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                              
                              self.pigBackTileSevenToggle.toggle()
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: pigBackTileEightToggle, blankImage: pigBackTileEight, animalImage: pigTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.pigBackTileEightToggle.toggle()
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: pigBackTileNineToggle, blankImage: pigBackTileNine, animalImage: pigTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.pigBackTileNineToggle.toggle()
                                      
                       })
                  }
               
               
               
              Spacer()
           }
            
        }
}


struct Lama: View {
    
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
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 10)
            

             HStack {//Row One
                               
                       FlipTile(tileImage: lamaBackTileOneToggle, blankImage: lamaBackTileOne, animalImage: lamaTileOne)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileOneToggle.toggle()
                               
                               
                           })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileTwoToggle, blankImage: lamaBackTileTwo, animalImage: lamaTileTwo)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileTwoToggle.toggle()
                       
                       
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileThreeToggle, blankImage: lamaBackTileThree, animalImage: lamaTileThree)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileThreeToggle.toggle()
                       
                       
                       })
                       
                       
                       
                   }//End of HStack
               
               
               
               
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Two
                       
                       FlipTile(tileImage: lamaBackTileFourToggle, blankImage: lamaBackTileFour, animalImage: lamaTileFour)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileFourToggle.toggle()
                               
                               
                       })
                       Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileFiveToggle, blankImage: lamaBackTileFive, animalImage: lamaTileFive)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileFiveToggle.toggle()
                               
                       })
                       Spacer().frame(width: 0)
                       FlipTile(tileImage: lamaBackTileSixToggle, blankImage: lamaBackTileSix, animalImage: lamaTileSix)
                       
                           .gesture(TapGesture().onEnded() {
                               
                               self.lamaBackTileSixToggle.toggle()
                               
                       })
                   }
               
               
               Spacer().frame(height: 0)
                   HStack {//Row Three
                                  
                        FlipTile(tileImage: lamaBackTileSevenToggle, blankImage: lamaBackTileSeven, animalImage: lamaTileSeven)
                                          
                          .gesture(TapGesture().onEnded() {
                              
                              self.lamaBackTileSevenToggle.toggle()
                              
                      })
                      Spacer().frame(width: 0)
                       
                        FlipTile(tileImage: lamaBackTileEightToggle, blankImage: lamaBackTileEight, animalImage: lamaTileEight)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.lamaBackTileEightToggle.toggle()
                                      
                       })
                      Spacer().frame(width: 0)
                       
                       FlipTile(tileImage: lamaBackTileNineToggle, blankImage: lamaBackTileNine, animalImage: lamaTileNine)
                                          
                           .gesture(TapGesture().onEnded() {
                              
                              self.lamaBackTileNineToggle.toggle()
                                      
                       })
                  }
               
               
               
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
                 .rotation3DEffect(self.tileImage ? Angle(degrees: 180): Angle(degrees: 360), axis: (x:CGFloat(0), y:CGFloat(10), z:CGFloat(0)))
                           .animation(.default)
            
            
       
    }
    
    
}//End of FlipTile
