//
//  FirstViewController.swift
//  Web Search
//
//  Created by wm1 on 2017-11-23.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate {

    var history = [String]()
    
    @IBAction func back(_ sender: Any) {
        webview.goBack()
    }
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func search(_ sender: Any) {
        
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.delegate = self
        
        present(searchController, animated: true, completion: nil)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        
        activityIndicator.center = self.view.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        dismiss(animated: true, completion: nil)
        
        if let searchResult = searchBar.text {
            
            let url = URL(string: "https://" + searchResult)
            
            webview.loadRequest(URLRequest(url: url!))
            
            history.append(searchResult)
            
            activityIndicator.stopAnimating()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        
        webview.loadRequest(URLRequest(url: url!))
        
        history.append("https://www.google.com")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

