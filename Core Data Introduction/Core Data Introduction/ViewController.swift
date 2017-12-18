//
//  ViewController.swift
//  Core Data Introduction
//
//  Created by wm1 on 2017-11-24.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext

        let newUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUsers.setValue("gavinzz", forKey: "username")
        newUsers.setValue("password", forKey: "password")
        newUsers.setValue(21, forKey: "age")
        

        
        do {
            
            try context.save()
            
            print("User Saved")
            
        } catch {
            
            print("There was an error hapenning")
            
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let result = try context.fetch(request)
            
            print(result.count)
            
            print(result)

        } catch {
            
            print("Couln't fetch results")
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

