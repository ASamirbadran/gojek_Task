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
}

extension ContactService: TargetType {
    var baseURL: URL {
       switch self {
        case .readContacts:
            return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
        case .readContactByUrl(let url ):
            return URL(string: url )!
       case .favoriteContactById:
            return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
        }
    }
    
    var path: String {
        switch self {
        case .readContacts:
            return "/contacts.json"
        case .readContactByUrl:
            return ""
        case .favoriteContactById(let Id):
            return "/contacts/\(Id).json" .removingPercentEncoding!
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readContacts, .readContactByUrl:
            return .get
        case .favoriteContactById:
            return .put
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readContacts, .readContactByUrl, .favoriteContactById:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readContacts, .readContactByUrl:
            return .requestPlain
        case .favoriteContactById(let id, let isFavorite):
            return .requestParameters(parameters: ["id": id,"favorite": isFavorite,
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

