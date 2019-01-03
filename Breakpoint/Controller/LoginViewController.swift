//
//  LoginViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/03.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTxtField: InsetTextField!
    @IBOutlet weak var passwordTxtField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    @IBAction func dismissBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if(emailTxtField.text != nil && passwordTxtField.text != nil) {
            AuthService.instance.loginUser(withEmail: emailTxtField.text!, andPassword: passwordTxtField.text!) { (success, error) in
                if(success) {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!, userCreationComplete: { (success, error) in
                    if(success) {
                        AuthService.instance.loginUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!) { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                        }
                    } else {
                        print(String(describing: error?.localizedDescription))
                    }
                })
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}
