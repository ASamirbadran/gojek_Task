//
//  BaseProtocol.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation

@objc
protocol PresenterLifeCycleProtocol {

    @objc
    optional func loadView()
    
    @objc
    optional func viewDidLoad()
    
    @objc
    optional func viewWillAppear()
    
    @objc
    optional func viewDidAppear()
    
    @objc
    optional func didReceiveMemoryWarning()
    
    @objc
    optional func viewWillDisappear()
    
    @objc
    optional func viewDidDisappear()
}

protocol BasePresenterProtocol: class, PresenterLifeCycleProtocol {

}
