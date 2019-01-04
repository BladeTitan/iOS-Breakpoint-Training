//
//  GroupFeedTableViewCell.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class GroupFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func setupCell(profileImage: UIImage, username: String, content: String) {
        profileImg.image = profileImage
        usernameLbl.text = username
        messageLbl.text = content
    }
}
