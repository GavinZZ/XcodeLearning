//
//  ViewController.swift
//  Times Table
//
//  Created by wm1 on 2017-09-25.
//  Copyright © 2017 wm1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var table: UITableView!
  @IBAction func sliderMoved(sender: AnyObject) {
    print(slider.value)
    table.reloadData()
  }
  
  internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 50
  }

  internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    cell.textLabel?.text = String(slider.value * Float(indexPath.row+1) * Float(20))
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

