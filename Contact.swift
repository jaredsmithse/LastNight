//
//  Contact.swift
//  LastNight
//
//  Created by Jared Smith on 7/21/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

import Foundation

class Contact {
    var firstName: String
    var lastName: String
    var createdAtDate: NSDate
    
    init(firstName: String, lastName: String, createdAt: NSDate) {
        self.firstName = firstName
        self.lastName = lastName
        self.createdAtDate = createdAt
    }
    
    func fullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
}
