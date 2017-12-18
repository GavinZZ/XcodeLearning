//
//  ViewController.swift
//  UserLogInCheck
//
//  Created by wm1 on 2017-11-24.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")

        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            print(results)
            
        } catch {
            
            print("Failed")
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var text: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var context = appDelegate.persistentContainer.viewContext
    
    @IBAction func submit(_ sender: Any) {
        
        userFound = false
        
        let request =  NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = true
        
        do {
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if (text.text == result.value(forKey: "username") as? String) {
                    
                    userFound = true
                    
                    do {
                        
                        try context.save()
                        
                    } catch {
                        
                        
                        
                    }
                    
                }
                
            }
            
            if (userFound) {
                
                print("Hello! Welcome back, " + text.text!)
                
                let label = UILabel()
                
                label.text = "Hello! Welcome back, " + text.text!
                
                label.center = self.view.center
                
                label.isHighlighted = false
                
            } else {
                
                let alert = UIAlertController(title: "User Not Found", message: "The user is not found. Do you want to register as a new user?", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: { (alertAction) in
                    
                    let userAdd = NSEntityDescription.insertNewObject(forEntityName: "Users", into: self.context)
                    
                    userAdd.setValue(self.text.text, forKey: "username")
                    
                }))
                
                alert.addAction(UIAlertAction(title: "Reject", style: UIAlertActionStyle.default, handler: { (alertAcion) in
                    
                    print("Please register yourself")
                    
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
        } catch {
            
            print("failed")
            
        }
        
        userFound = false
        
    }
    
    
    
    var userFound: Bool = false
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

