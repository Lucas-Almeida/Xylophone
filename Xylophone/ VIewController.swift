//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController{
    let soundArray = [
        (Bundle.main.url(forResource: "note1", withExtension: "wav")),
        (Bundle.main.url(forResource: "note2", withExtension: "wav")),
        (Bundle.main.url(forResource: "note3", withExtension: "wav")),
        (Bundle.main.url(forResource: "note4", withExtension: "wav")),
        (Bundle.main.url(forResource: "note5", withExtension: "wav")),
        (Bundle.main.url(forResource: "note6", withExtension: "wav")),
        (Bundle.main.url(forResource: "note7", withExtension: "wav"))
    ]
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func playSound(senderTag: Int) {
        let url = soundArray[senderTag]
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch {
            print(error.localizedDescription)
        }
        
//        if let soundURL = soundArray[senderTag] {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            AudioServicesPlaySystemSound(mySound)
//        }
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // sender tag goes from 1 to 7
        playSound(senderTag: sender.tag - 1)
    }
}

extension AVAudioPlayerDelegate {
    
}
