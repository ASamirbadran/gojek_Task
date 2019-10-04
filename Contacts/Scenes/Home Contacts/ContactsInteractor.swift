//
//  ContactsInteractor.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ContactsInteractor {

    internal weak var presenter: ContactsInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: ContactsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension ContactsInteractor: ContactsInteractorInputProtocol {

}
