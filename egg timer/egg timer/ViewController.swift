//
//  ViewController.swift
//  egg timer
//
//  Created by wm1 on 2017-09-25.
//  Copyright © 2017 wm1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "Cell")
  
    cell.textLabel?.text = "Top row"
    
    return cell
    
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

