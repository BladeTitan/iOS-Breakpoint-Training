//
//  Group.swift
//  Breakpoint
//
//  Created by Armand Kamffer on 2019/01/04.
//  Copyright © 2019 Armand Kamffer. All rights reserved.
//

import Foundation

class Group {
    private var _title: String
    private var _description: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        _title = title
        _description = description
        _key = key
        _memberCount = memberCount
        _members = members
    }
}
