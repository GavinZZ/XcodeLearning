//
//  ViewController.swift
//  SearchMap
//
//  Created by wm1 on 2017-11-22.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import MapKit

extension ViewController: MKLocalSearchCompleterDelegate {
    
    private func completerDidUpdateResults(completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    private func completer(completer: MKLocalSearchCompleter, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //change searchCompleter depends on searchBar's text
        if !searchText.isEmpty {
            searchCompleter.queryFragment = searchText
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
//        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
//        Temp Data
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
//
//        cell.textLabel?.text = String(indexPath.row)
//
//        return cell
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    var searchCompleter = MKLocalSearchCompleter()
    
    var searchResults = [MKLocalSearchCompletion]()
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func search(_ sender: Any) {
        
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.delegate = self
        
        present(searchController, animated: true, completion: nil)

        table.isHidden = false
        
        table.becomeFirstResponder()
        
    }
    
    func searchBarTextDidEndEditing(_ searchBarr: UISearchBar) {
        
        searchCompleter.delegate = self
        
        completerDidUpdateResults(completer: searchCompleter)
        
        searchBar(searchBarr, textDidChange: searchBarr.text!)
        
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        // This stops user using the app while searching.
        
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        activityIndicator.center = self.view.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        // Hide search bar

        dismiss(animated: true, completion: nil)
        
        // Create search request
        
        let searchRequest = MKLocalSearchRequest()
        
        let address = tableView.cellForRow(at: indexPath)?.textLabel?.text!
        
        searchRequest.naturalLanguageQuery = tableView.cellForRow(at: indexPath)?.textLabel?.text!
        
        table.isHidden = true
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (result, error) in
            
            activityIndicator.stopAnimating()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if (error != nil) {
                
                let alert = UIAlertController(title: "IMPORTANT", message: "An Error Has Occurred!", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                // Remove all the current annotations
                
                for annotation in self.map.annotations {
                    
                    self.map.removeAnnotation(annotation)
                    
                }
                
                let lat = result?.boundingRegion.center.latitude
                
                let lon = result?.boundingRegion.center.longitude
                
                let annotation = MKPointAnnotation()
                
                annotation.title = address
                
                annotation.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
                
                self.map.addAnnotation(annotation)
                
                // Zoom into the region
                
                let latDelta = 0.005
                
                let LonDelta = 0.005
                
                let span = MKCoordinateSpanMake(latDelta, latDelta)
                
                let region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(lat!, lon!), span)
                
                self.map.region = region
                
            }
            
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
        table.isHidden = true
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        // This stops user using the app while searching.
        
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        activityIndicator.center = self.view.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        // Hide search bar
        
        searchBar.resignFirstResponder()
        
        dismiss(animated: true, completion: nil)
        
        // Create search request
        
        let searchRequest = MKLocalSearchRequest()
        
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (result, error) in
            
            activityIndicator.stopAnimating()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if (error != nil) {
                
                let alert = UIAlertController(title: "IMPORTANT", message: "An Error Has Occurred!", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)

            } else {
                
                // Remove all the current annotations
                
                for annotation in self.map.annotations {
                
                    self.map.removeAnnotation(annotation)
                    
                }
                
                let lat = result?.boundingRegion.center.latitude
                
                let lon = result?.boundingRegion.center.longitude
                
                let annotation = MKPointAnnotation()
                
                annotation.title = searchBar.text
                
                annotation.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
                
                self.map.addAnnotation(annotation)
                
                // Zoom into the region
                
                let latDelta = 0.005
                
                let LonDelta = 0.005
                
                let span = MKCoordinateSpanMake(latDelta, latDelta)
                
                let region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(lat!, lon!), span)
                
                self.map.region = region
                
            }
            
        }
        
    }
    
    @IBOutlet weak var map: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.isHidden = true
        
        let alert = UIAlertController(title: "Request Location Usage", message: "To access the app, please allow location access. \n Warning: If rejected, the app will close automatically.", preferredStyle: UIAlertControllerStyle.alert)
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.red]), forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reject", style: UIAlertActionStyle.default, handler: { (action) in

            exit(0)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

