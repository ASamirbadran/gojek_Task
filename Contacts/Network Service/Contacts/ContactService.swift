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
}

extension ContactService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
    }
    
    var path: String {
        switch self {
        case .readContacts:
            return "/contacts.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readContacts:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readContacts:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readContacts :
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
