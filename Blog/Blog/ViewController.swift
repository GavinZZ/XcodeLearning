//
//  ViewController.swift
//  Blog
//
//  Created by wm1 on 2017-11-28.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var web: UIWebView!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var context = appDelegate.persistentContainer.viewContext
    
    @IBAction func back(_ sender: Any) {
        
        performSegue(withIdentifier: "ContentToTable", sender: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Blog")
        
        request.returnsObjectsAsFaults = true
        
        do {
            
            let results = try context.fetch(request) as! [NSManagedObject]
            
            web.loadHTMLString(results[activeRow].value(forKey: "content") as! String, baseURL: nil)
            
        } catch {
            
            print("Unable to fetch result")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

