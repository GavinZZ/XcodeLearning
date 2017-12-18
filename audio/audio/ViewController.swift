//
//  ViewController.swift
//  audio
//
//  Created by wm1 on 2017-11-24.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
    }
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
    }
    
    
    @IBAction func slider(_ sender: Any) {
        
        player.volume = sliderValue.value
        
    }
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "half", ofType: ".mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

