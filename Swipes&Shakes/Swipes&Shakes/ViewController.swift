//
//  ViewController.swift
//  Swipes&Shakes
//
//  Created by wm1 on 2017-11-24.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @objc func swipe(guesture: UIGestureRecognizer) {
        
        if let swipeGuesture = guesture as? UISwipeGestureRecognizer {
            
            switch swipeGuesture.direction {
                
            case UISwipeGestureRecognizerDirection.right:
                print("Swipe Right")
                
            case UISwipeGestureRecognizerDirection.left:
                print("Swipe Left")
                
            default:
                break
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(guesture:)))
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(guesture:)))
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if (event?.subtype == UIEventSubtype.motionShake) {
            
            print("Device was shaken")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

