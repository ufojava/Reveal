//
//  AudioTextFile.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 27/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct AudioTextFile: View {
    var body: some View {
        
        
        VStack {
        
        
        Button(action: {
            
            
            playSound(sound: "pig", type: "mp3")
            
            
        }) {
            
            Text("Play Sound")
            
            
            
        }
        
        
        
        Button(action: {
            
            readGameSpeech(word: "Hello World, my name is Ufuoma")
            
        }) {
            
            
            Text("Synthsizer")
        }
    }
        
       
        
        
    }
}

struct AudioTextFile_Previews: PreviewProvider {
    static var previews: some View {
        AudioTextFile()
    }
}
