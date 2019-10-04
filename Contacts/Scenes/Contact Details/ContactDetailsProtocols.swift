//
//  ContactDetailsProtocols.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol ContactDetailsPresenterProtocol: BasePresenterProtocol {

    var interactor: ContactDetailsInteractorInputProtocol? { get set }
    /* ViewController -> Presenter */
    func getUserDetails(url: String)

}

protocol ContactDetailsInteractorInputProtocol: class {

    var presenter: ContactDetailsInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func fetchUserDetails(url: String)
}

// MARK: - Interactor -> Presenter

protocol ContactDetailsInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func userDetailsFetchedSuccessfully(fetchedContact: Contact)
    func errorFetchingContactDetails(title: String, errorMessage: String)

}

// MARK: - Presenter -> ViewController

protocol ContactDetailsViewProtocol: BaseViewProtocal {

    var presenter: ContactDetailsPresenterProtocol? { get set }
    func loadData(fetchedContact: Contact)

    /* Presenter -> ViewController */
}

// MARK: - Router

protocol ContactDetailsWireframeProtocol: class {

}
