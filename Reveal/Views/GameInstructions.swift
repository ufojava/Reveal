//
//  GameInstructions.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 04/03/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//View for Game Instructions
import SwiftUI



struct GameInstructions: View {
    
    
    var body: some View {
        
       
        
        ZStack {
            
            Color(red: 0.6, green: 0.3, blue: 0.3)
            .edgesIgnoringSafeArea(.all)
                    
            VStack{
                Text("\n(1) Click Circle to begin game \n (2) Guess animal behind square from six animals \n (3) If incorrect, click get number \n (4) Click square number \n (5) Still can't guess?, get another number and select square \n (6) The more squares you reveal, 2 points are taken \n (7) Click on the Circle to exit game")
                    .font(.custom("Gill Sans", size: 15))
            
      
            }
            
            
        }
    }
}




//Preview Game Instructions
struct GameInstructions_Preview: PreviewProvider {
    
    
    static var previews: some View {
    
    GameInstructions()
        
    }
}




