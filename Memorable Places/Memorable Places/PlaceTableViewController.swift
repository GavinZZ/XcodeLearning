//
//  PlaceTableViewController.swift
//  Memorable Places
//
//  Created by wm1 on 2017-11-21.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

var places = [Dictionary<String, String>()]
var activePos = -1

class PlaceTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        table.reloadData()
        
        if (places.count == 1 && places[0].count == 0) {
            
            places.remove(at: 0)
            
            places.append(["name": "Taj Mahal", "lat": "27.175277", "lon": "78.042128"])
            
        }
        
         UserDefaults.standard.set(places, forKey: "places")
        
        activePos = -1

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tempPlaces = UserDefaults.standard.object(forKey: "places") as? [Dictionary<String, String>] {
            
            places = tempPlaces
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        if  places[indexPath.row]["name"] != nil {
            
            cell.textLabel?.text = places[indexPath.row]["name"]
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activePos = indexPath.row
        
        performSegue(withIdentifier: "toMap", sender: nil)
        
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            places.remove(at: indexPath.row)
            UserDefaults.standard.set(places, forKey: "places")
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
