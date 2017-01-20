//
//  SigninViewController.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/22/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

class SigninViewController: UITableViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let params = ["password":"password"]
////        let params = ["email": "a@b.com"]
//        Network.signup(params, success: { user in
//            print(user)
//        }, failure: { error in
//        })
        
        emailField.text = "vnjp22@gmail.com"
        passwordField.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func signin(_ sender: UIButton!) {
        let email = emailField.text
        let password = passwordField.text
        
        let params = ["email": email!, "password": password!]
        Network.signin(params as [String : AnyObject], success: { user in
            Helper.navigate(_Main, vc: _Main)
        }, failure: { error in
            Helper.error(error)
        })
    }
    
}

