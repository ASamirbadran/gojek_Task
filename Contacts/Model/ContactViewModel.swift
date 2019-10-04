//
//  ContactViewModel.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

class ContactViewModel: NSObject {
    let id: Int
    let firstName: String
    let lastName: String
    let profilePic: String
    let favorite: Bool
    let url: String
    
    let fullName: String

    init(contact: Contact) {
        self.id = (contact.id ?? 0)
        self.firstName = (contact.firstName ?? "")
        self.lastName = (contact.lastName ?? "")
        self.profilePic = (contact.profilePic ?? "")
        self.favorite = (contact.favorite ?? false)
        self.url = (contact.url ?? "")
        self.fullName = firstName + " " + lastName
    }
}
