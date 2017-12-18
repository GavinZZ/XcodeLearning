//
//  ViewController.swift
//  audioControll
//
//  Created by wm1 on 2017-11-24.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var player = AVAudioPlayer()
    
    let audioPath = Bundle.main.path(forResource: "half", ofType: ".mp3")

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func slider(_ sender: Any) {

        player.currentTime = TimeInterval(sliderValue.value)
        
    }
    
    
    @IBAction func volumeSlide(_ sender: Any) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.scrubberMove), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
        timer.invalidate()
        
    }
    
    @IBAction func reset(_ sender: Any) {
        
        timer.invalidate()
        
        player.stop()
        
        player.currentTime = 0
        
        sliderValue.value = 0
        
    }
    
    @objc func scrubberMove() {
        
        sliderValue.value = Float(player.currentTime)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: "images.jpeg")
        
        

        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            sliderValue.maximumValue = Float(player.duration)
            
        } catch {
            
            
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

