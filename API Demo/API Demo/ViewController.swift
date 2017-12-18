//
//  ViewController.swift
//  API Demo
//
//  Created by wm1 on 2017-11-27.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=93ab5a2bb49ca59b9d13e2ae4c13597a")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            print(description)
                            
                        }
                        
                        print(jsonResult)
                        
                    } catch {
                        
                        print("JSON processing failed")
                        
                    }
                    
                }
                
            }
            
        }
        
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

