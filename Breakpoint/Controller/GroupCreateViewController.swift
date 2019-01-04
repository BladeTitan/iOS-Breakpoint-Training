//
//  GroupCreateViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class GroupCreateViewController: UIViewController {
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var addMemberLbl: UILabel!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        emailTextField.delegate = self
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
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
        
    }
}

extension GroupCreateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            let image = UIImage(named: "defaultProfileImage")!

            cell.setupCell(profileImage: image, email: emailArray[indexPath.row], isSelected: true)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension GroupCreateViewController: UITextFieldDelegate {
    
}
