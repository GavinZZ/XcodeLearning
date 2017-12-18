//
//  ViewController.swift
//  Animations
//
//  Created by wm1 on 2017-11-13.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var timer = Timer()
    var start = false
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonText: UIButton!
    @objc func animate() {
        if (count > 12) {
            image.image = UIImage(named: "frame_\(count)_delay-2s.gif")
            count = 0
        } else if (count < 10) {
            image.image = UIImage(named: "frame_0\(count)_delay-0.08s.gif")
        } else {
            image.image = UIImage(named: "frame_\(count)_delay-0.08s.gif")
        }
        count += 1
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 2, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 2, animations: {
            self.image.frame = CGRect(x: 0, y: 85, width: 265, height: 278)
        })
    }
    
    @IBAction func next(_ sender: Any) {
        if (start == false) {
            start = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            buttonText.setTitle("Stop Animation", for: [])
        } else {
            start = false
            image.image = UIImage(named: "frame_00_delay-0.08s.gif")
            count = 0
            timer.invalidate()
            buttonText.setTitle("Start Animation", for: [])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

