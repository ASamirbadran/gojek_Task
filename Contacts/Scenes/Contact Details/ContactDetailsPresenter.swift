//
//  ContactDetailsPresenter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ContactDetailsPresenter: NSObject {

    private weak var view: ContactDetailsViewProtocol?
    internal var interactor: ContactDetailsInteractorInputProtocol?
    private var router: ContactDetailsWireframeProtocol?

    init(interface: ContactDetailsViewProtocol,
         interactor: ContactDetailsInteractorInputProtocol?,
         router: ContactDetailsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension ContactDetailsPresenter: ContactDetailsPresenterProtocol {
    func getUserDetails(url: String) {
        view?.showLoadingIndicator?()
        interactor?.fetchUserDetails(url: url)
    }
    

}
extension ContactDetailsPresenter: ContactDetailsInteractorOutputProtocol {
    func userDetailsFetchedSuccessfully(fetchedContact: Contact) {
        view?.loadData(fetchedContact: fetchedContact)
        view?.hideLoadingIndicator?()

    }
    
    func errorFetchingContactDetails(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    

}
