//
//  AppDelegate+Extension.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

extension AppDelegate {
    
    func initNetwork() {
        //getting from enviroment xconfig
        let defaults = NetworkDefaults(baseUrl: Environment.rootURL, apiKey: Environment.apiKey)
        NetworkManager.shared = NetworkManager(config: defaults)
    }
    
    func openHomeScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let homeVc = Container.embedVCInNavController(Container.getHomeScreen())
        self.window?.rootViewController = homeVc
        self.window?.makeKeyAndVisible()
    }
    
    func setUpKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
    }
}
