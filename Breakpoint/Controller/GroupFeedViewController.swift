//
//  GroupFeedViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit
import FirebaseAuth

class GroupFeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var groupTitleLbl: UILabel!
    
    var group: Group?
    var messages = [Message]()
    
    func initData(group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageView.bindToKeyboard()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let group = group {
            groupTitleLbl.text = group.title
            self.memberLbl.text = group.members.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroupFeedMessages(group: self.group!, handler: { (messages) in
                self.messages = messages
                self.tableView.reloadData()
                
                if(self.messages.count > 0) {
                    DispatchQueue.main.async {
                        let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
                    }
                }
            })
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: Any) {
        let message: String = messageTextField.text!
        
        if(message != "") {
            sendBtn.isEnabled = false
            messageTextField.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: message, forUID: (Auth.auth().currentUser?.email)!, withGroupKey: (group?.key)!) { (success) in
                if(success) {
                    self.sendBtn.isEnabled = true
                    self.messageTextField.isEnabled = true
                    self.messageTextField.text = ""
                }
            }
        }
    }
}

extension GroupFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedTableViewCell") as? GroupFeedTableViewCell {
            let image = UIImage(named: "defaultProfileImage")!
            let email = messages[indexPath.row].senderId
            let content = messages[indexPath.row].content
            
            cell.setupCell(profileImage: image, username: email, content: content)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
