//
//  AnimalSound.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 27/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Play Sound File
import Foundation
import AVFoundation



    var audioPlayer: AVAudioPlayer?

    var videoPlayer: AVPlayer?

//Funciton play sound
func playSound(sound: String, type: String) {
    

    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        let url = URL(fileURLWithPath: path)
        
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                audioPlayer?.play()
                
                
            } catch {
                
                print("Unable to find sound file")
                
                
            
        }

    
}

}

