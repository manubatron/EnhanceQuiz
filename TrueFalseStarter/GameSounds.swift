//
//  GameSounds.swift
//  TrueFalseStarter
//
//  Created by Julius Manubay on 10/23/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

// Class to hold the sound features of the app.
class GameSounds {
    var gameSound: SystemSoundID = 0
    
    func loadGameStartSound() {
        
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }

    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}
