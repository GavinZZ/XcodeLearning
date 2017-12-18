//
//  ViewController.swift
//  downloading image and save permanently
//
//  Created by wm1 on 2017-11-29.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if (documentPath.count > 0) {
            
            if let documentDirectory = documentPath[0] as? String {
                
                let restorePath = documentDirectory + "/greatWall.jpg"
                
                image.image = UIImage(contentsOfFile: restorePath)
                
            }
            
        }
        
        
//        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg/800px-The_Great_Wall_of_China_at_Jinshanling-edit.jpg")!
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if (error != nil) {
//
//                print("Shit")
//
//            } else {
//
//                if let data = data {
//
//                    if let greatWall = UIImage(data: data) {
//
//                        self.image.image = greatWall
//
//                        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//
//                        if (documentPath.count > 0) {
//
//                            if let documentDirectory = documentPath[0] as? String {
//
//                                let saveDirectory = documentDirectory + "/greatWall.jpg"
//
//                                do {
//
//                                    try UIImageJPEGRepresentation(greatWall, 1)?.write(to: URL(fileURLWithPath: saveDirectory))
//
//                                } catch {
//
//                                    print("Shit")
//
//                                }
//
//                            }
//
//                        }
//
//                    }
//
//                }
//
//            }
//
//        }
//
//        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

