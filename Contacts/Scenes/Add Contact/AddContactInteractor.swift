//
//  AddContactInteractor.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class AddContactInteractor {

    internal weak var presenter: AddContactInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: AddContactInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension AddContactInteractor: AddContactInteractorInputProtocol {
    func saveContact(contact: Contact) {
            NetworkManager.shared?.addContact(contact: contact,completion: { (result: Result<Data, NetworkError>, statusCode) in
                switch result {
                case .success:
                    self.presenter?.contactSavedSuccessfully()
                case .failure(let error):
                    self.presenter?.errorSavingContact(
                        title: L10n.error,
                        errorMessage: "\(error.message ?? "smth went wrong") \(error.code ?? 0)")
                }
            })
        }

}
