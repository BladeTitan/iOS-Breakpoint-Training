//
//  GroupCreateViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit
import FirebaseAuth

class GroupCreateViewController: UIViewController {
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var addMemberLbl: UILabel!
    
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        emailTextField.delegate = self
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        doneBtn.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func textFieldDidChange() {
        if(emailTextField.text == "") {
            self.emailArray.removeAll()
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailTextField.text!) { (emails) in
                self.emailArray = emails
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        let title = titleTextField.text
        let description = descriptionTextField.text
        
        if(title != "" && description != "") {
            chosenUserArray.append((Auth.auth().currentUser?.email)!)
            
            DataService.instance.createGroup(title: title!, description: description!, ids: chosenUserArray) { (completed) in
                if(completed) {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("Failed to create group")
                }
            }
        }
    }
}

extension GroupCreateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            let image = UIImage(named: "defaultProfileImage")!
            let email = emailArray[indexPath.row]
            var selected = false
            
            if(chosenUserArray.contains(email)) {
                selected = true
            }
            
            cell.setupCell(profileImage: image, email: email, isSelected: selected)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let email = emailArray[indexPath.row]
        
        if(!chosenUserArray.contains(email)) {
            chosenUserArray.append(email)
        } else {
            if let index = chosenUserArray.firstIndex(of: email) {
                chosenUserArray.remove(at: index)
            }
        }
        
        addMemberLbl.text = chosenUserArray.joined(separator: ", ")
        
        if(addMemberLbl.text == "") {
            addMemberLbl.text = "add people to your group"
            doneBtn.isHidden = true
        } else {
            doneBtn.isHidden = false
        }
    }
}

extension GroupCreateViewController: UITextFieldDelegate {
    
}
