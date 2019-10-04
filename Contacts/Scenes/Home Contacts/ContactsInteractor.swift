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
    func fetchContacts() {
        NetworkManager.shared?.getContacts(completion: { (result: Result<[Contact], NetworkError>, statusCode) in
            switch result {
            case .success(let contactList):
                self.presenter?
                    .contactFetchedSuccessfully(contactList: contactList)
            case .failure(let error):
                self.presenter?.errorFetchingContacts(
                    title: L10n.error,
                    errorMessage: "\(error.message ?? "smth went wrong") \(error.code ?? 0)")
                
            }
        })
    }
}

