//
//  SecondViewController.swift
//  Advanced Segues
//
//  Created by wm1 on 2017-11-21.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var activeRow = -1

    @IBOutlet weak var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(activeRow)
        
        let url = NSURL(fileURLWithPath: "https://www.stackoverflow.com")
        
        webview.loadRequest(URLRequest(url: url as URL))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
