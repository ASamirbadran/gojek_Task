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
    private var contactViewModel: ContactViewModel?
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
    func editContact(contact: ContactViewModel) {
        router?.getToEditScreen(contactToEdit: contact)
    }
    
    var fetchedContact: ContactViewModel {
        return contactViewModel!
    }
    
    func changeIsFavorite(isFavorite: Bool) {
        view?.showLoadingIndicator?()
        if let contactVm = contactViewModel {
            interactor?.saveIsFavorite(id: contactVm.id, isFavorite: isFavorite)
        }
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
        self.contactViewModel = ContactViewModel(contact: fetchedContact)
        view?.hideLoadingIndicator?()

    }
    
    func errorFetchingContactDetails(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
    

}
