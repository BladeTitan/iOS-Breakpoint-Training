//
//  UserTableViewCell.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    var checked = false
    
    func setupCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        profileImg.image = image
        emailLbl.text = email
        checkImg.isHidden = !isSelected
        checked = !isSelected
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if(selected) {
            checkImg.isHidden = !checked
            checked = !checked
        }
    }

}
