//
//  EditContactProtocols.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol EditContactPresenterProtocol: BasePresenterProtocol {

    var interactor: EditContactInteractorInputProtocol? { get set }
    func editContact(contact: ContactViewModel)
    /* ViewController -> Presenter */
}

protocol EditContactInteractorInputProtocol: class {

    var presenter: EditContactInteractorOutputProtocol? { get set }
    func submitNewContact(contact: ContactViewModel)

    /* Presenter -> Interactor */
}

// MARK: - Interactor -> Presenter

protocol EditContactInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func contactSubmittedSuccessfully()
    func errorSubmittingContact(title: String, errorMessage: String)
}

// MARK: - Presenter -> ViewController

protocol EditContactViewProtocol: BaseViewProtocal {

    var presenter: EditContactPresenterProtocol? { get set }
    func dismissVc()

    /* Presenter -> ViewController */
}

// MARK: - Router

protocol EditContactWireframeProtocol: class {
}
