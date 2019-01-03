//
//  AuthViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/03.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func signInByFacebookBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signInByGoogleBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signInByEmailBtnPressed(_ sender: UIButton) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
            present(loginVC, animated: true)
        }
    }
    
}
