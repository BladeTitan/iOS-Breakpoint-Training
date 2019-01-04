//
//  GroupTableViewCell.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func setupCell(title: String, description: String, memberCount: Int) {
        titleLbl.text = title
        descriptionLbl.text = description
        memberCountLbl.text = "\(memberCount) members"
    }
}
