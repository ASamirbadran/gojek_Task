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
}

extension ContactService: TargetType {
    var baseURL: URL {
       switch self {
        case .readContacts:
            return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
        case .readContactByUrl(let url ):
            return URL(string: url )!
        }
    }
    
    var path: String {
        switch self {
        case .readContacts:
            return "/contacts.json"
        case .readContactByUrl:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readContacts, .readContactByUrl:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readContacts, .readContactByUrl:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readContacts, .readContactByUrl :
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
