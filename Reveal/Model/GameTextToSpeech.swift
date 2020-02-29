//
//  GameTextToSpeech.swift
//  Reveal
//
//  Created by Ufuoma Okoro on 29/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Text to speech
import Foundation
import AVFoundation


func readGameSpeech(word: String) {
    
    
    let utterance = AVSpeechUtterance(string: word)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    
    //Utterance rate
    utterance.rate = 0.5
    
    let synthersizer = AVSpeechSynthesizer()
    synthersizer.speak(utterance)
    
    
    
}
