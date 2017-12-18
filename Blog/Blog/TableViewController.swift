//
//  TableViewController.swift
//  Blog
//
//  Created by wm1 on 2017-11-28.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreData

var activeRow = 0

class TableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.googleapis.com/blogger/v3/blogs/1747027701196237068/posts?key=AIzaSyDSpBScQhpt6Zo3pparSMQgYftaEsyjRdc")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let items = jsonResult["items"] as? NSArray {
                            
                            for item in items {
                                
                                if let content = item as? NSDictionary {
                                    
                                    print(jsonResult)
                                    
                                    let blog = NSEntityDescription.insertNewObject(forEntityName: "Blog", into: self.context)

                                    blog.setValue(content["published"], forKey: "published")
                                    
                                    blog.setValue(content["content"], forKey: "content")
                                    
                                    blog.setValue(content["title"], forKey: "title")
                                    
                                    do {
                                        
                                        try self.context.save()
                                        
                                    } catch {
                                        
                                        print("Unable to save")
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    } catch {
                        
                        print("JSON Processing Failed")
                        
                    }
                    
                }
                
            }
            
        }
        
        task.resume()
        
        table.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var count = -1
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Blog")
        
        request.returnsObjectsAsFaults = true
        
        do {
            
            let results = try context.fetch(request)
            
            count = results.count
            
        } catch {
            
            print("Unable to fetch it")
            
        }
        
        return count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Blog")
        
        request.returnsObjectsAsFaults = true
        
        do {
            
            let results = try context.fetch(request) as! [NSManagedObject]

            cell.textLabel?.text = results[indexPath.row].value(forKey: "title") as! String
            
        } catch {
            
            print("Unable to fetch it")

        }
        
        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activeRow = indexPath.row
        
        performSegue(withIdentifier: "TableToContent", sender: nil)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
