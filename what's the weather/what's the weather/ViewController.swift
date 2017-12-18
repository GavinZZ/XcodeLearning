//
//  ViewController.swift
//  what's the weather
//
//  Created by wm1 on 2017-11-27.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var country: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + text.text! + "," + country.text! + "&appid=93ab5a2bb49ca59b9d13e2ae4c13597a") {
        
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if (error != nil) {
                    
                    print(error)
                    
                } else if ((response as! HTTPURLResponse).statusCode == 404) {
                    
//                    DispatchQueue.main.sync(execute: {
                    
                        self.weatherLabel.text = "Unable to locate the city"
                        
                        while (self.weatherLabel.text == "Unable to locate the city") {
                            self.weatherLabel.isHidden = false
                            break
                        }
                        
//                    })
                    
                } else {
                    
                    if let urlContent = data {
                        
                        do {
                            
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                             if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                DispatchQueue.main.sync(execute: {
                                    
                                    self.weatherLabel.text = description
                                    
                                })

                            }
                            
                        } catch {
                            
                            print("JSON Processing failed")
                            
                        }
                        
                    }
                    
                }
                
            }
           
            task.resume()
            
            while (weatherLabel.text != "Label") {
                weatherLabel.isHidden = false
                break
            }
            
        } else {
            
            weatherLabel.text = "Unable to locate the city"
            
            while (weatherLabel.text != "Label") {
                weatherLabel.isHidden = false
                break
            }
            
        }
        
    }
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherLabel.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
}

