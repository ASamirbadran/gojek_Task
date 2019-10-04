//
//  AppDelegate+Extension.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func initNetwork() {
        //getting from enviroment xconfig
        let defaults = NetworkDefaults(baseUrl: Environment.rootURL, apiKey: Environment.apiKey)
        NetworkManager.shared = NetworkManager(config: defaults)
    }
}
