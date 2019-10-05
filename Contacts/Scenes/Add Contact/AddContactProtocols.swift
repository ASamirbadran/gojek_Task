//
//  AddContactProtocols.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol AddContactPresenterProtocol: BasePresenterProtocol {

   var interactor: AddContactInteractorInputProtocol? { get set }
   func addContact(contact: Contact)
    

    /* ViewController -> Presenter */
}

protocol AddContactInteractorInputProtocol: class {

    var presenter: AddContactInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func saveContact(contact: Contact)

}

// MARK: - Interactor -> Presenter

protocol AddContactInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func contactSavedSuccessfully()
    func errorSavingContact(title: String, errorMessage: String)


}

// MARK: - Presenter -> ViewController

protocol AddContactViewProtocol: BaseViewProtocal {

    var presenter: AddContactPresenterProtocol? { get set }

    /* Presenter -> ViewController */

}

// MARK: - Router

protocol AddContactWireframeProtocol: class {
    func NavigateToHome()
}
