//
//  EditContactPresenter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class EditContactPresenter: NSObject {

    private weak var view: EditContactViewProtocol?
    internal var interactor: EditContactInteractorInputProtocol?
    private var router: EditContactWireframeProtocol?

    init(interface: EditContactViewProtocol,
         interactor: EditContactInteractorInputProtocol?,
         router: EditContactWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension EditContactPresenter: EditContactPresenterProtocol {
    func editContact(contact: ContactViewModel) {
        view?.showLoadingIndicator?()
        interactor?.submitNewContact(contact: contact)
    }
    

}
extension EditContactPresenter: EditContactInteractorOutputProtocol {
    func errorSubmittingContact(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    
    func contactSubmittedSuccessfully() {
        view?.hideLoadingIndicator?()
        view?.dismissVc()
    }

}
