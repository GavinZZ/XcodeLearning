//
//  AccountViewController.swift
//  ParseStarterProject-Swift
//
//  Created by WM1 on 12/19/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import AccountKit

class AccountViewController: UIViewController, AKFViewControllerDelegate {
    
    var accountKit: AKFAccountKit!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        if accountKit == nil {
            // may also specify AKFResponseTypeAccessToken
            self.accountKit = AKFAccountKit(responseType: AKFResponseType.accessToken)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if (accountKit.currentAccessToken != nil) {
            // if the user is already logged in, go to the main screen
            print("User already logged in go to ViewController")
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "showhome", sender: self)
            })
            
        }
        
    }

func viewController(_ viewController: UIViewController!, didCompleteLoginWith accessToken: AKFAccessToken!, state: String!) {
    print("Login succcess with AccessToken")
}
func viewController(_ viewController: UIViewController!, didCompleteLoginWithAuthorizationCode code: String!, state: String!) {
    print("Login succcess with AuthorizationCode")
}
private func viewController(_ viewController: UIViewController!, didFailWithError error: NSError!) {
    print("We have an error \(error)")
}
func viewControllerDidCancel(_ viewController: UIViewController!) {
    print("The user cancel the login")
}

func prepareLoginViewController(_ loginViewController: AKFViewController) {
    
    loginViewController.delegate = self
    loginViewController.setAdvancedUIManager(nil)
    
    
    //Costumize the theme
    let theme:AKFTheme = AKFTheme.default()
    theme.headerBackgroundColor = UIColor(red: 0.325, green: 0.557, blue: 1, alpha: 1)
    theme.headerTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    theme.iconColor = UIColor(red: 0.325, green: 0.557, blue: 1, alpha: 1)
    theme.inputTextColor = UIColor(white: 0.4, alpha: 1.0)
    theme.statusBarStyle = .default
    theme.textColor = UIColor(white: 0.3, alpha: 1.0)
    theme.titleColor = UIColor(red: 0.247, green: 0.247, blue: 0.247, alpha: 1)
    loginViewController.setTheme(theme)
    
}

@IBAction func loginWithPhone(_ sender: AnyObject) {
    //login with Phone
    let inputState: String = UUID().uuidString
    let viewController:AKFViewController = accountKit.viewControllerForPhoneLogin(with: nil, state: inputState)  as! AKFViewController
    viewController.enableSendToFacebook = true
    self.prepareLoginViewController(viewController)
    self.present(viewController as! UIViewController, animated: true, completion: nil)
}
@IBAction func loginWithEmail(_ sender: AnyObject) {
    //login with Email
    let inputState: String = UUID().uuidString
    let viewController: AKFViewController = accountKit.viewControllerForEmailLogin(withEmail: nil, state: inputState)  as! AKFViewController
    self.prepareLoginViewController(viewController)
    self.present(viewController as! UIViewController, animated: true, completion: { _ in })
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
