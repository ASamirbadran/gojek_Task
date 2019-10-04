//
//  ContactsPresenter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ContactsPresenter: NSObject {

    private weak var view: ContactsViewProtocol?
    internal var interactor: ContactsInteractorInputProtocol?
    private var router: ContactsWireframeProtocol?

    init(interface: ContactsViewProtocol,
         interactor: ContactsInteractorInputProtocol?,
         router: ContactsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension ContactsPresenter: ContactsPresenterProtocol {
    func getContacts() {
        view?.showLoadingIndicator?()
        interactor?.fetchContacts()
    }
}
extension ContactsPresenter: ContactsInteractorOutputProtocol {
    func contactFetchedSuccessfully(contactList: [Contact]) {
        view?.hideLoadingIndicator?()
        print(contactList)
    }
    
    func errorFetchingContacts(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    

}
