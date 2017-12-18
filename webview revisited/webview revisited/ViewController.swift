//
//  ViewController.swift
//  webview revisited
//
//  Created by wm1 on 2017-11-23.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func refresh(_ sender: Any) {
        
        webview.reload()
        
    }
    @IBAction func back(_ sender: Any) {
        
        webview.goBack()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.workmarket.com")
        
        webview.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

