//
//  GamesView.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 23/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


struct Games: View {
    
    var body: some View {
        
        //Test Area 
        //Rabbit()
        Sheep()
        
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
            
            
            
            
        }
        
        
    }
}




struct Sheep: View {
    
    //Declare rabbit tiles
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
