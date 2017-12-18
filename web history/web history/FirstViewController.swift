//
//  FirstViewController.swift
//  web history
//
//  Created by wm1 on 2017-11-23.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {
    
    var count = 0
    
    var timer = Timer()
    
    @IBOutlet weak var image: UIImageView!
    
    var history = [String]()

    @IBAction func forward(_ sender: Any) {
        
        webview.goForward()
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webview.reload()
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        webview.goBack()
        
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.autocorrectionType = .no
        
        searchController.searchBar.autocapitalizationType = .none
        
        
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

            history.append("https://" + searchResult.lowercased())
            
            UserDefaults.standard.set(history, forKey: "history")
            
            activityIndicator.stopAnimating()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            
        }
        
    }
    
    @objc func animate() {

        if (count < 10) {
        
            image.image = UIImage(named: "frame_0" + String(describing: count) + "_delay-0.04s.gif")
            
        } else if (count < 46) {
            
            image.image = UIImage(named: "frame_" + String(describing: count) + "_delay-0.04s.gif")
            
        } else {
            
            image.image = UIImage(named: "frame_46_delay-0.04s.gif")
            
            count = 0
            
        }
        
        count += 1

    }
    
    var value = 0
    
    var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var webview: UIWebView!
    
//    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//
//        history.removeLast()
//
//        UserDefaults.standard.set(history, forKey: "history")
//
//    }
    
    var timertwo = Timer()
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        imageview.alpha = 1

        image.alpha = 1
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: self.view.center.x, y: 100, width: 10, height: 10))
        
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(FirstViewController.animate), userInfo: nil, repeats: true)
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("FAILED")
        
        history = UserDefaults.standard.object(forKey: "history") as! [String]
        
        print(history)
        
        UserDefaults.standard.set(history, forKey: "history")
        
        let alert = UIAlertController(title: "Failed to load web", message: "Will automatically load \"Google\"", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        let url = URL(string: "www.google.com")
        
        webview.loadRequest(URLRequest(url: url!))
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        DispatchQueue.main.async {
            
            self.activityIndicator.stopAnimating()
            
            self.activityIndicator.isHidden = true
        }

        timer.invalidate()
        
        timertwo.invalidate()
        
        value = 0
        
        count = 0
        
        image.alpha = 0

    }
   
    
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        image.alpha = 0
        
        image.image = UIImage(named: "frame_00_delay-0.04s.gif")
        
        count = 0
        
        value = 0
        
        if (fromHistory) {
            
            let url = URL(string: link)
            
            webview.loadRequest(URLRequest(url: url!))

            fromHistory = false
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.alpha = 0
        
        image.image = UIImage(named: "frame_00_delay-0.04s.gif")
        
        if let his = (UserDefaults.standard.object(forKey: "history") as? [String]) {
            
            if (!his.isEmpty) {
                
                history = UserDefaults.standard.object(forKey: "history") as! [String]
                
            } else {
                
                history.append("https://www.google.com")
                
            }
            
        }
        
        let url = URL(string: "https://www.google.com")
        
        webview.loadRequest(URLRequest(url: url!))
        
        UserDefaults.standard.set(history, forKey: "history")
        
        print(UserDefaults.standard.object(forKey: "history"))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

