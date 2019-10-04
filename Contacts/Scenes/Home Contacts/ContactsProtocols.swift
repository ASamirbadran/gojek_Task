//
//  ContactsProtocols.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol ContactsPresenterProtocol: BasePresenterProtocol {

    var interactor: ContactsInteractorInputProtocol? { get set }

    /* ViewController -> Presenter */
    func getContacts()
}

protocol ContactsInteractorInputProtocol: class {

    var presenter: ContactsInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func fetchContacts()
}

// MARK: - Interactor -> Presenter

protocol ContactsInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func contactFetchedSuccessfully(contactList: [Contact])
    func errorFetchingContacts(title: String, errorMessage: String)
}

// MARK: - Presenter -> ViewController

protocol ContactsViewProtocol: BaseViewProtocal {

    var presenter: ContactsPresenterProtocol? { get set }

    /* Presenter -> ViewController */
}

// MARK: - Router

protocol ContactsWireframeProtocol: class {

}
