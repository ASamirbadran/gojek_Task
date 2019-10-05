//
//  EditContactInteractor.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class EditContactInteractor {

    internal weak var presenter: EditContactInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: EditContactInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension EditContactInteractor: EditContactInteractorInputProtocol {
    func submitNewContact(contact: ContactViewModel) {
        NetworkManager.shared?.editContact(contact: contact,completion: { (result: Result<Data, NetworkError>, statusCode) in
            switch result {
            case .success:
                self.presenter?.contactSubmittedSuccessfully()
            case .failure(let error):
                self.presenter?.errorSubmittingContact(
                    title: L10n.error,
                    errorMessage: "\(error.message ?? "smth went wrong") \(error.code ?? 0)")
            }
        })
    }
}
