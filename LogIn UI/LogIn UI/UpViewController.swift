//
//  UpViewController.swift
//  LogIn UI
//
//  Created by wm1 on 2017-11-29.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData

class UpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var label: UILabel!

    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        var results = [NSManagedObject]()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            results = try context.fetch(request) as! [NSManagedObject]
            
        } catch {
            
            print("Couldn't fetch results")
            
        }
        
        label.alpha = 0
        
        if (!isValidEmailAddress(emailAddressString: email.text as! String)) {
            
            label.text = "Please enter correct email address."
            
            label.alpha = 1
            
        } else if (password.text!.count < 6) {
            
            label.text = "Password needs to have at least 6 characters."
            
            label.alpha = 1
            
        } else {
            
            print(results)
            
            var userFound = false
            
            for result in results {
            
                if (email.text == result.value(forKey: "email") as? String) {
                    
                    userFound = true
                    
                    label.text = "Email address already exists."
                    
                    label.alpha = 1
                    
                }
            }
            
            if (!userFound) {
                
                let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
                
                newUser.setValue(email.text, forKey: "email")
                
                newUser.setValue(password.text, forKey: "password")
                
                do {
                    
                    try context.save()
                    
                    
                } catch {
                    
                    let alert = UIAlertController(title: "Unknown Error Encountered", message: "Unable to sign up. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
            
        }
        
    }
    
    @IBOutlet weak var createAccount: UIButton!
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        if (email.text != "" && password.text != "") {
            
            createAccount.isEnabled = true
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if (email.text != "" && password.text != "") {
            
            createAccount.isEnabled = true
            
        }
        
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.alpha = 0
        
        createAccount.isEnabled = false
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let context = appDelegate.persistentContainer.viewContext
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//
//        request.returnsObjectsAsFaults = false
//
//        do {
//
//            let results = try context.fetch(request)
//
//            for result in results as! [NSManagedObject] {
//
//                context.delete(result)
//
//            }
//
//            try context.save()
//
//            print(results)
//
//
//        } catch {
//
//            print("Couln't fetch results")
//
//        }
        
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
