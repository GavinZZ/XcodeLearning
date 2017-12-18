//
//  ViewController.swift
//  Webview
//
//  Created by wm1 on 2017-10-05.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var webview: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    if let url = NSURL(string: "http://www.stackoverflow.com") {
      let request = NSURLRequest(URL: url)
      let task = NSURLSession.sharedSession().dataTaskWithRequest(request as NSURLRequest) {
        data, response, error in
        
        if error != nil {
          print(error)
        } else {
          if let unwrappedData = data {
            let dataString = NSString(data: unwrappedData, encoding: NSUTF8StringEncoding)
            print(dataString)
          }
        }
      }
      task.resume()
      
    }
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

