//
//  AddContactPresenter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class AddContactPresenter: NSObject {

    private weak var view: AddContactViewProtocol?
    internal var interactor: AddContactInteractorInputProtocol?
    private var router: AddContactWireframeProtocol?

    init(interface: AddContactViewProtocol,
         interactor: AddContactInteractorInputProtocol?,
         router: AddContactWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension AddContactPresenter: AddContactPresenterProtocol {
    func addContact(contact: Contact) {
        view?.showLoadingIndicator?()
        interactor?.saveContact(contact: contact)
    }
    

}
extension AddContactPresenter: AddContactInteractorOutputProtocol {
    func contactSavedSuccessfully() {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: "Done", body: "Saved Successfully")
        router?.NavigateToHome()

    }
    
    func errorSavingContact(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    

}
