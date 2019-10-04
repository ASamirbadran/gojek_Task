//
//  NetworkManager.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation
import Moya

typealias StatusCode = Int

class NetworkManager {
    
    static var shared: NetworkManager!
    
    var networkConfig: NetworkDefaults?
    
    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
     //auth tocken, api key will be embedded here (if needed  by contacts app  backend)
        let headerPlugin = StaticHeaderPlugin(
            headers: [
                "Content-Type": "application/json"
            ])
        
        provider = MoyaProvider<MultiTarget>(//manager: ,
            plugins: [headerPlugin, NetworkLoggerPlugin(verbose: true)])
    }
    
}

