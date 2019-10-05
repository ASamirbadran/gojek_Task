//
//  Contact.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

struct Contact : Codable {
    let id : Int?
    let firstName : String?
    let lastName : String?
    let profilePic : String?
    let favorite : Bool?
    let url : String?
    
    let phoneNumber: String?
    let email: String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case favorite = "favorite"
        case url = "url"
        
        case phoneNumber = "phone_number"
        case email = "email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }
    
    //for saving contact
    init(fname: String, lname: String, email: String, phone: String) {
        self.email = email
        self.firstName = fname
        self.lastName = lname
        self.phoneNumber = phone
        self.profilePic = nil
        self.url = nil
        self.favorite = nil
        self.id = nil
    }

}
