//
//  ContentView.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 23/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
        VStack {
        
        Rabbit()
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
    @State private var rabbitBackTileOne = "rabbitArtBack1"
    @State private var rabbitBackTileTwo = "rabbitArtBack2"
    @State private var rabbitBackTileThree = "rabbitArtBack3"
    @State private var rabbitBackTileFour = "rabbitArtBack4"
    @State private var rabbitBackTileFive = "rabbitArtBack5"
    @State private var rabbitBackTileSix = "rabbitArtBack6"
    @State private var rabbitBackTileSeven = "rabbitArtBack7"
    @State private var rabbitBackTileEight = "rabbitArtBack8"
    @State private var rabbitBackTileNine = "rabbitArtBack9"
    
    
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
    
    
    
    struct FlipTile: View {
        
        var tileImage: Bool
        var blankImage = ""
        var rabbitImage = ""
        
        
        var body: some View {
          
            
                Image(tileImage ? blankImage: rabbitImage)
                    .resizable()
                    .frame(width:92, height: 101, alignment: .center)
                
                //Set Animation
                     .rotation3DEffect(self.tileImage ? Angle(degrees: 180): Angle(degrees: 360), axis: (x:CGFloat(0), y:CGFloat(10), z:CGFloat(0)))
                               .animation(.default)
                
                
           
        }
        
        
    }//End of FlipTile
    
    
    
    
    var body: some View {
        
        VStack {
        
                HStack {//Row One
                    
                    FlipTile(tileImage: rabbitBackTileOneToggle, blankImage: rabbitBackTileOne, rabbitImage: rabbitTileOne)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileOneToggle.toggle()
                            
                            
                        })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileTwoToggle, blankImage: rabbitBackTileTwo, rabbitImage: rabbitTileTwo)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileTwoToggle.toggle()
                    
                    
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileThreeToggle, blankImage: rabbitBackTileThree, rabbitImage: rabbitTileThree)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileThreeToggle.toggle()
                    
                    
                    })
                    
                    
                    
                }//End of HStack
            
            
            
            
            
            
            Spacer().frame(height: 0)
                HStack {//Row Two
                    
                    FlipTile(tileImage: rabbitBackTileFourToggle, blankImage: rabbitBackTileFour, rabbitImage: rabbitTileFour)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileFourToggle.toggle()
                            
                            
                    })
                    Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileFiveToggle, blankImage: rabbitBackTileFive, rabbitImage: rabbitTileFive)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileFiveToggle.toggle()
                            
                    })
                    Spacer().frame(width: 0)
                    FlipTile(tileImage: rabbitBackTileSixToggle, blankImage: rabbitBackTileSix, rabbitImage: rabbitTileSix)
                    
                        .gesture(TapGesture().onEnded() {
                            
                            self.rabbitBackTileSixToggle.toggle()
                            
                    })
                }
            
            
            Spacer().frame(height: 0)
                HStack {//Row Three
                               
                     FlipTile(tileImage: rabbitBackTileSevenToggle, blankImage: rabbitBackTileSeven, rabbitImage: rabbitTileSeven)
                                       
                       .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileSevenToggle.toggle()
                           
                   })
                   Spacer().frame(width: 0)
                    
                     FlipTile(tileImage: rabbitBackTileEightToggle, blankImage: rabbitBackTileEight, rabbitImage: rabbitTileEight)
                                       
                        .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileEightToggle.toggle()
                                   
                    })
                   Spacer().frame(width: 0)
                    
                    FlipTile(tileImage: rabbitBackTileNineToggle, blankImage: rabbitBackTileNine, rabbitImage: rabbitTileNine)
                                       
                        .gesture(TapGesture().onEnded() {
                           
                           self.rabbitBackTileNineToggle.toggle()
                                   
                    })
               }
            
            
            
            
        }
        
        
    }
}


struct DisplayTile: View {
    
    //Image
    var tileImage: String
    
    var body: some View {
        
        Image(tileImage)
        .resizable()
        .scaledToFill()
        .frame(width:92, height: 101)
            
        
    }

    
}
