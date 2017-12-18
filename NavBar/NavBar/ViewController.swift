//
//  ViewController.swift
//  NavBar
//
//  Created by wm1 on 2017-09-25.
//  Copyright © 2017 wm1. All rights reserved.
//

import UIKit
import NewsstandKit

class ViewController: UIViewController {
  
  
  var timer = NSTimer()

  @IBAction func button1(sender: AnyObject) {
    
    
    print("Pressed")

    timer.invalidate()
  }

  
  func addTime11() {
    
    print("A second has passed")
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
    
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.addTime11), userInfo: nil, repeats: true)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

