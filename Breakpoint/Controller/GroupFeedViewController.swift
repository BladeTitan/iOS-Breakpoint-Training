//
//  GroupFeedViewController.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class GroupFeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    
    var messages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageView.bindToKeyboard()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: Any) {
        
    }
}

extension GroupFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedTableViewCell") as? GroupFeedTableViewCell {
            let image = UIImage(named: "defaultProfileImage")!
            let username = "akamffer@mweb.co.za"
            let content = "Test"
            
            cell.setupCell(profileImage: image, username: username, content: content)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
