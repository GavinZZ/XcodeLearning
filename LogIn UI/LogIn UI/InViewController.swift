//
//  ViewController.swift
//  LogIn UI
//
//  Created by wm1 on 2017-11-29.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData


class InViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        
        label.alpha = 0
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = true
        
        do {
            
            let results: [NSManagedObject] = try context.fetch(request) as! [NSManagedObject]
            
            var userFound = false
            
            for result in results {
                
                if (email.text == result.value(forKey: "email") as? String && password.text == result.value(forKey: "password") as? String) {
                    
                    userFound = true
                    
                }
                
            }
            
            if (userFound) {
                
                print("Logged In")
                
            } else {
                
                label.text = "Email or password field is incorrect."
                
                label.alpha = 1
                
            }
            
        } catch {
            
        }
        
    }
    
    @IBOutlet weak var sign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.alpha = 0
        sign.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if (email.text != "" && password.text != "") {
            
            sign.isEnabled = true
            
        }
        
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
        if (email.text != "" && password.text != "") {
            
            sign.isEnabled = true
            
        }
        
    }
    
}

