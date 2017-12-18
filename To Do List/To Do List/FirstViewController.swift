//
//  FirstViewController.swift
//  To Do List
//
//  Created by wm1 on 2017-11-08.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var table: UITableView!
    var ar = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = ar[indexPath.row] as! String
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let items = UserDefaults.standard.object(forKey: "array") as? [String]
        
        if let tempItems = items as? [String] {
            ar = tempItems
        }
        
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            ar.remove(at: indexPath.row)
            UserDefaults.standard.set(ar, forKey: "array")
            table.reloadData()
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

