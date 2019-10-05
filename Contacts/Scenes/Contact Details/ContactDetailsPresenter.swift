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
    private var contact: Contact!
    private var contactUrl: String = ""

    init(interface: ContactDetailsViewProtocol,
         interactor: ContactDetailsInteractorInputProtocol?,
         router: ContactDetailsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension ContactDetailsPresenter: ContactDetailsPresenterProtocol {
    var fetchedContact: Contact {
        return contact
    }
    
    func changeIsFavorite(isFavorite: Bool) {
        view?.showLoadingIndicator?()
        interactor?.saveIsFavorite(id: contact.id ?? 0, isFavorite: isFavorite)
        
    }
    
    func getUserDetails(url: String) {
        view?.showLoadingIndicator?()
        self.contactUrl = url
        interactor?.fetchUserDetails(url: url)
    }
    

}
extension ContactDetailsPresenter: ContactDetailsInteractorOutputProtocol {
    func isFavoritedSuccessfully() {
        //will call getuserdetails or change button stat
        view?.hideLoadingIndicator?()
        //fetch again
        getUserDetails(url: contactUrl)
        
    }
    
    func errorSavingFavoriteState(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    
    func userDetailsFetchedSuccessfully(fetchedContact: Contact) {
        view?.loadData(fetchedContact: fetchedContact)
        self.contact = fetchedContact
        view?.hideLoadingIndicator?()

    }
    
    func errorFetchingContactDetails(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    

}
