//
//  SecondViewController.swift
//  To Do List
//
//  Created by wm1 on 2017-11-08.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    var arr = [String]()
    
    @IBAction func submit(_ sender: Any) {
        if let previous: [String] = (UserDefaults.standard.object(forKey: "array") as? [String]) {
            if arr == [String]() {
                for value in previous {
                    arr.append(value)
                }
            }
        } else {
            arr = [String]()
        }
        
        if textField.text != "" {
            arr.append(textField.text!)
            UserDefaults.standard.set(arr, forKey: "array")
        }
        print(arr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

