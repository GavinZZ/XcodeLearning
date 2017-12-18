//
//  ViewController.swift
//  PDS
//
//  Created by wm1 on 2017-11-03.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name = ""
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func submit(_ sender: Any) {
        name = String(describing: textField.text!)
        label.text = String(name)
        UserDefaults.standard.set(name, forKey: "name")
        print(name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let DN = UserDefaults.standard.object(forKey: "name")!
        label.text = String(describing: DN)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

