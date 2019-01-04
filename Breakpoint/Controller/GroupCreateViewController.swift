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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        
    }
}
