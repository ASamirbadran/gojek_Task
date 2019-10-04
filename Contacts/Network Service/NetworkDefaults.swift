//
//  NetworkDefaults.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String
    var apiKey: String
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults(baseUrl: "error", apiKey: "")
        return instance
    }
}
