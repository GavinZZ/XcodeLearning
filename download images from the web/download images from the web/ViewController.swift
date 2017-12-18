//
//  ViewController.swift
//  download images from the web
//
//  Created by wm1 on 2017-11-27.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

        if (documentsPath.count > 0) {

            if let documentDirectory = documentsPath[0] as? String {

                let restorePath = documentDirectory + "/greatWall.jpg"

                let newImage = UIImage(contentsOfFile: restorePath)

                image.image = newImage
            }

        }
        
        
        
        
//
//
//        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg/800px-The_Great_Wall_of_China_at_Jinshanling-edit.jpg")!
//
//        let request = NSMutableURLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
//
//            if (error != nil) {
//
//                print(error)
//
//            } else {
//
//                if let data = data {
//
//                    if let greatWall = UIImage(data: data) {
//
//                        self.image.image = greatWall
//
//                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//
//                        if (documentsPath.count > 0) {
//
//                            if let documentDirectory = documentsPath[0] as? String {
//
//                                let savePath = documentDirectory + "/greatWall.jpg"
//
//                                do {
//
//                                    try UIImageJPEGRepresentation(greatWall, 1)?.write(to: URL(fileURLWithPath: savePath))
//
//                                } catch {
//
//                                }
//
//                            }
//
//                        }
//
//                    }
//
//
//                }
//
//            }
//
//        }
//
//        task.resume()
//
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

