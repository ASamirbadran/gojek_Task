//
//  ContactService.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation
import Moya

enum ContactService {
    case readContacts
    case readContactByUrl(url: String)
    case favoriteContactById(Id: Int, isFavorite: Bool)
    case editContactById(modifiedContact: ContactViewModel)
}

extension ContactService: TargetType {
    var baseURL: URL {
       switch self {
        case .readContacts:
            return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
        case .readContactByUrl(let url ):
            return URL(string: url )!
       case .favoriteContactById, .editContactById:
            return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
        }
    }
    
    var path: String {
        switch self {
        case .readContacts:
            return "/contacts.json"
        case .readContactByUrl:
            return ""
        case .favoriteContactById(Id: let id, isFavorite: _):
            return "/contacts/\(id).json"
        case .editContactById(modifiedContact: let contact):
            return "/contacts/\(contact.id).json"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readContacts, .readContactByUrl:
            return .get
        case .favoriteContactById, .editContactById:
            return .put
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readContacts, .readContactByUrl, .favoriteContactById, .editContactById:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readContacts, .readContactByUrl:
            return .requestPlain
        case .favoriteContactById(let id, let isFavorite):
            return .requestParameters(parameters: ["id": id,"favorite": isFavorite,
            ], encoding: JSONEncoding.default)
        case .editContactById(let contact):
            return .requestParameters(parameters:
                ["id": contact.id,
                 "favorite": contact.favorite,
                 "first_name": contact.firstName,
                 "last_name": contact.lastName,
                 "email": contact.email,
                 "phone_number": contact.phoneNumber
            ], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

