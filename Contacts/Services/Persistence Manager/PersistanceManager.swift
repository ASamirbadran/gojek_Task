//
//  PersistanceManager.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

extension PersistenceKeyBase {
    public static let appVersion = PersistenceKey<String?>(key: "appVersion", defaultValue: nil)
    
    public static let userName = PersistenceKey<String?>(key: "user_name", defaultValue: nil)
    
    public static let userAuthKey = PersistenceKey<String?>(key: "user_auth", defaultValue: nil)
    
}

open class PersistanceManager: KeyValuePersistence {
    
    public func valueForKey<T>(_ key: PersistenceKey<T>) -> T {
        let value = userDefaults.object(forKey: key.key)
        return (value as? T) ?? key.defaultValue
    }
    
    public func setValue<T>(_ value: T?, forKey key: PersistenceKey<T>) {
        guard let value = value else {
            userDefaults.removeObject(forKey: key.key)
            return
        }
        
        if let value = value as? Int {
            userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Float {
            userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Double {
            userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Bool {
            userDefaults.set(value, forKey: key.key)
        } else if let value = value as? URL {
            userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Data {
            userDefaults.set(value, forKey: key.key)
        } else {
            userDefaults.set(value, forKey: key.key)
        }
    }
    
    public func removeValueForKey<T>(_ key: PersistenceKey<T?>) {
        userDefaults.removeObject(forKey: key.key)
    }
    
    public let userDefaults: UserDefaults
    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    internal static  var shared: PersistanceManager = {
        let instance = PersistanceManager(userDefaults: .standard)
        return instance
    }()
    
    public static func valueForKey<T>(_ key: PersistenceKey<T>) -> T {
        let value = shared.userDefaults.object(forKey: key.key)
        return (value as? T) ?? key.defaultValue
    }
    
    public static func setValue<T>(_ value: T?, forKey key: PersistenceKey<T>) {
        
        guard let value = value else {
            shared.userDefaults.removeObject(forKey: key.key)
            return
        }
        
        if let value = value as? Int {
            shared.userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Float {
            shared.userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Double {
            shared.userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Bool {
            shared.userDefaults.set(value, forKey: key.key)
        } else if let value = value as? URL {
            shared.userDefaults.set(value, forKey: key.key)
        } else if let value = value as? Data {
            shared.userDefaults.set(value, forKey: key.key)
        } else {
            shared.userDefaults.set(value, forKey: key.key)
        }
    }
    
    public static func removeValueForKey<T>(_ key: PersistenceKey<T?>) {
        shared.userDefaults.removeObject(forKey: key.key)
    }
    
    
    //setting userAuthKey (for future use) // if contacts is accessed by auth tocken
    public class func setUserTocken(_ value: String, isLoggedIn: Bool) {
        shared.setValue(value, forKey: PersistenceKeyBase.userAuthKey)
    }
}
