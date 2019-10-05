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
    var firstName: String
    var lastName: String
    let profilePic: String
    let favorite: Bool
    let url: String
    var phoneNumber: String
    var email: String
    
    let fullName: String

    init(contact: Contact) {
        self.id = (contact.id ?? 0)
        self.firstName = (contact.firstName ?? "")
        self.lastName = (contact.lastName ?? "")
        self.profilePic = (contact.profilePic ?? "")
        self.favorite = (contact.favorite ?? false)
        self.url = (contact.url ?? "")
        self.phoneNumber = (contact.phoneNumber ?? "")
        self.email = (contact.email ?? "")

        self.fullName = firstName + " " + lastName
    }
    
    func editContact(fname: String, lname: String, email: String, phone: String) {
        self.firstName = fname
        self.lastName = lname
        self.phoneNumber = phone
        self.email = email
    }
    
}
