//
//  ContactsTests.swift
//  ContactsTests
//
//  Created by Ahmed Samir on 10/5/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import XCTest
@testable import Contacts

class ContactsTests: XCTestCase {
    
    func test_AddTextFielsplaceholder() {
        let addVc = Container.getAddContactScreen()
        let _ = addVc.view
        XCTAssertEqual("First Name", addVc.contactFirsNameTextField.placeholder)
        XCTAssertEqual("Last Name", addVc.contactLastNameTextField.placeholder)
        XCTAssertEqual("mobile", addVc.contactPhoneTextField.placeholder)
        XCTAssertEqual("email", addVc.contactEmailTextField.placeholder)
    }
    
    
    
    
}
