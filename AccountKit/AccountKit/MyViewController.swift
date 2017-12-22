//
//  ViewController.swift
//  AccountKit
//
//  Created by WM1 on 12/19/17.
//  Copyright © 2017 WM1. All rights reserved.
//

import UIKit
import AccountKit

class ViewController: UIViewController {
    
    var accountKit:
    var _pendingLoginViewController: AKFViewController?
    var _authorizationCode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if _accountKit == nil {
            _accountKit = AKFAccountKit(responseType: .AuthorizationCode)
        }
        _pendingLoginViewController = _accountKit!.viewControllerForLoginResume() as? AKFViewController
        _pendingLoginViewController?.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func prepareLoginViewController(loginViewController: AKFViewController) {
        loginViewController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

