//
//  SecondViewController.swift
//  web history
//
//  Created by wm1 on 2017-11-23.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

var fromHistory = false
var link = ""

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = history[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            
            history.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(history, forKey: "history")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toHome", sender: nil)
        
        link = history[indexPath.row]
        
        fromHistory = true
        
    }
    
    @IBAction func clear(_ sender: Any) {
        
        history.removeAll()
        
        UserDefaults.standard.set(history, forKey: "history")
        
        table.reloadData()
        
    }
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        history = UserDefaults.standard.object(forKey: "history") as! [String]
        
        table.reloadData()
        
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

