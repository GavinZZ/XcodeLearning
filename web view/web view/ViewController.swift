//
//  ViewController.swift
//  web view
//
//  Created by wm1 on 2017-10-04.
//  Copyright © 2017 wm1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var webview: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let url = NSURL(string: "http://www.stackoverflow.com")!
    webview.loadRequest(NSURLRequest(URL: url))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

