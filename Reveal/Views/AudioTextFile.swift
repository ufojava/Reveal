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
        
        
        
        
        
        Button(action: {
            
            
            playSound(sound: "pig", type: "m4a")
            
            
        }) {
            
            Text("Play Sound")
            
            
            
        }
    }
}

struct AudioTextFile_Previews: PreviewProvider {
    static var previews: some View {
        AudioTextFile()
    }
}
