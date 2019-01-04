//
//  AuthService.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/03.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }

            let userData: [String: Any] = ["provider": user.user.providerID, "email": user.user.email!]
            DataService.instance.createDBUser(uid: user.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if(error != nil) {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
}
